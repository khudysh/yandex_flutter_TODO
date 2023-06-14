import 'package:flutter/material.dart';
import 'package:flutter_task_manager/widgets/task_list_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskListView extends StatefulWidget {
  final String tasksPlaceholderTitle;
  const TaskListView({
    super.key,
    required this.tasksPlaceholderTitle,
  });

  @override
  State<TaskListView> createState() =>
      _TaskListViewState(tasksPlaceholderTitle);
}

class _TaskListViewState extends State<TaskListView> {
  late var tasksPlaceholderTitle;
  bool isFormShow = false;

  _TaskListViewState(String incomeTasksPlaceholderTitle) {
    tasksPlaceholderTitle = incomeTasksPlaceholderTitle;
  }
  TextEditingController _controller = TextEditingController();

  List<Widget> taskList = [
    TaskListItem(tasksPlaceholderTitle: "tasksPlaceholderTitle"),
    TaskListItem(tasksPlaceholderTitle: "tasksPlaceholderTitle"),
    TaskListItem(tasksPlaceholderTitle: "tasksPlaceholderTitle"),
    TaskListItem(tasksPlaceholderTitle: "tasksPlaceholderTitle"),
    TaskListItem(tasksPlaceholderTitle: "tasksPlaceholderTitle"),
    TaskListItem(tasksPlaceholderTitle: "tasksPlaceholderTitle"),
    TaskListItem(tasksPlaceholderTitle: "tasksPlaceholderTitle"),
    TaskListItem(tasksPlaceholderTitle: "tasksPlaceholderTitle"),
    TaskListItem(tasksPlaceholderTitle: "tasksPlaceholderTitle"),
    TaskListItem(tasksPlaceholderTitle: "tasksPlaceholderTitle"),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("рррр",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 56,
                          fontWeight: FontWeight.w800)),
                  Column(
                    children: [
                      FloatingActionButton.small(
                        onPressed: () => {},
                        tooltip: 'Save',
                        child: const Icon(Icons.save),
                      ),
                      FloatingActionButton.small(
                        onPressed: () {
                          setState(() {
                            isFormShow = true;
                            // taskList.removeAt(taskList.length - 1);
                          });
                        },
                        tooltip: 'Increment',
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(),
              isFormShow
                  ? TextField(
                      autofocus: true,
                      controller: _controller,
                      onEditingComplete: () {
                        setState(() {
                          taskList.insert(
                              0,
                              TaskListItem(
                                  tasksPlaceholderTitle: _controller.text));
                        });
                        isFormShow = false;
                        _controller.text = '';
                      },
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.primary),
                    )
                  : Container(),
            ],
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: taskList.length,
                itemBuilder: (context, index) => Dismissible(
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 15.0),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      key: UniqueKey(),
                      child: taskList[index],
                      onDismissed: (direction) {
                        setState(() {
                          taskList.removeAt(index);
                        });
                      },
                    )),
          )
        ],
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<Widget> ToDo = [];
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  ToDo.add(Container(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 27, 0, 0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                ToDo.removeAt(ToDo.length - 1);
                                ToDo.add(Text(_controller.text));
                              });
                            },
                            child: Container(
                                margin: const EdgeInsets.fromLTRB(10, 27, 0, 0),
                                child: Icon(Icons.abc_sharp)),
                          ),
                        ),
                        TextField(
                          controller: _controller,
                        ),
                      ],
                    ),
                  ));
                });
              },
              child: Container(
                  margin: const EdgeInsets.fromLTRB(10, 27, 0, 0),
                  child: Icon(Icons.abc)),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => ToDo[index],
                itemCount: ToDo.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
