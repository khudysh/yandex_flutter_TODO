import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_task_manager/features/main_tasks/ui/providers/task_provider.dart';
import 'package:flutter_task_manager/features/main_tasks/ui/utils/task_validator.dart';
import 'package:flutter_task_manager/features/main_tasks/ui/widgets/dismissible_task.dart';
import 'package:flutter_task_manager/features/main_tasks/ui/widgets/top_bar.dart';
import 'package:flutter_task_manager/features/task_adding/ui/task_adding_screen.dart';

class TaskScreen extends ConsumerStatefulWidget {
  const TaskScreen({super.key});

  @override
  ConsumerState<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends ConsumerState<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    List<Todo> todos = ref.watch(todosProvider).todos;
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
                    children: [
                      for (Todo todo in todos)
                        if (ref.read(todosProvider.notifier).showCompleted)
                          DissmisibleTask(todo)
                        else if (!todo.completed)
                          DissmisibleTask(todo)
                    ],
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
                            "Здесь могли быть ваши задачи...",
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskAddingScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
