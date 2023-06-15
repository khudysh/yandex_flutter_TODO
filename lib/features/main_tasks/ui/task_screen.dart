import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_manager/features/main_tasks/ui/providers/task_provider.dart';
import 'package:flutter_task_manager/features/main_tasks/ui/widgets/dismissible_task.dart';
import 'package:flutter_task_manager/features/main_tasks/ui/widgets/top_bar.dart';
import '../../task_adding/ui/task_adding_screen.dart';

final StateProvider hide = StateProvider<bool>((ref) {
  return false;
});
int count = 0;

class TaskScreen extends ConsumerStatefulWidget {
  const TaskScreen({super.key});

  @override
  ConsumerState<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends ConsumerState<TaskScreen> {
  List<Task> tasks = [];
  int taskIndex = 0;
  bool checked = false;

  void addTodoItem(String task) {
    setState(() {
      tasks.add(Task(task, taskIndex, false));
      taskIndex++;
    });
  }

  void removeTodoItem(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  bool checkHide(index) {
    return tasks[index].checked == true ? true : false;
  }

  void swipe(
    int index,
    direction,
  ) {
    switch (direction) {
      case DismissDirection.endToStart:
        setState(() {
          tasks.removeAt(index);
        });
        break;
      case DismissDirection.startToEnd:
        setState(() {
          tasks[index].checked = !tasks[index].checked;
          tasks[index].checked == true ? count++ : count--;
        });
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Todo> todos = ref.watch(todosProvider).todos;
    final click = ref.watch(hide);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const TopBar(),
          SliverToBoxAdapter(
            child: Card(
              margin: const EdgeInsets.all(8),
              elevation: 3,
              shape: const RoundedRectangleBorder(
                  side:
                      BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.1)),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Column(
                children: [
                  ListView(
                    physics: const ScrollPhysics(),
                    padding: const EdgeInsets.all(0),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children:
                        todos.map((todo) => DissmisibleTask(todo)).toList(),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(72, 22, 0, 22),
                          child: Text(
                            "Новое",
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.3),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final task = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskAddingScreen()),
          );
          if (task != null) {
            ref.read(todosProvider).addTodo(
                Todo(completed: false, description: task, id: todos.length));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


