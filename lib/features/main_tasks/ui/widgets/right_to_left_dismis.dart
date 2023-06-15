import 'package:flutter/material.dart';

import 'package:flutter_task_manager/features/main_tasks/ui/providers/task_provider.dart';

class RightToLeftDismis extends StatelessWidget {
  final Todo todo;
  const RightToLeftDismis(this.todo, {super.key}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 59, 48, 1),
          borderRadius: todo.id == 0
              ? const BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8))
              : null),
      padding: const EdgeInsets.fromLTRB(0, 0, 24, 0),
      child: const Icon(
        Icons.delete,
        color: Colors.white,
        size: 24,
      ),
    );
  }
}
