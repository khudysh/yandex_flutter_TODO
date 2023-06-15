import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_manager/features/main_tasks/ui/widgets/left_to_right_dismis.dart';
import 'package:flutter_task_manager/features/main_tasks/ui/widgets/right_to_left_dismis.dart';

import '../providers/task_provider.dart';

class DissmisibleTask extends ConsumerWidget {
  final Todo todo;

  const DissmisibleTask(this.todo, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          ref.read(todosProvider.notifier).toggleTodo(todo.id);
        } else if (direction == DismissDirection.endToStart) {
          ref.read(todosProvider.notifier).removeTodo(todo.id);
        }
      },
      key: UniqueKey(),
      background: LeftToRightDismis(todo),
      secondaryBackground: RightToLeftDismis(todo),
      child: Container(
        color: Colors.white,
        child: CheckboxListTile(
          activeColor: const Color.fromRGBO(52, 199, 89, 1),
          value: todo.completed,
          onChanged: (value) {
            ref.read(todosProvider.notifier).toggleTodo(todo.id);
          },
          secondary: const Icon(Icons.info_outline),
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(
            todo.description,
            style: todo.completed
                ? const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                    fontSize: 16,
                    fontWeight: FontWeight.w400)
                : const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
          ),
        ),
      ),
    );
  }
}
