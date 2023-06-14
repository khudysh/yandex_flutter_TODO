import 'package:flutter/material.dart';

class TaskListItem extends StatefulWidget {
  final String tasksPlaceholderTitle;
  const TaskListItem({
    super.key,
    required this.tasksPlaceholderTitle,
  });

  @override
  State<TaskListItem> createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  bool itemChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: -0.0),
      horizontalTitleGap: 10.0,
      leading: Checkbox(
        onChanged: (value) => {
          setState(() {
            itemChecked = !itemChecked;
          })
        },
        value: itemChecked,
      ),
      title: Text(
        widget.tasksPlaceholderTitle,
        style: TextStyle(
          fontSize: 18,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
    );
  }
}
