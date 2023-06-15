import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_manager/features/main_tasks/ui/widgets/left_to_right_dismis.dart';
import 'package:flutter_task_manager/features/main_tasks/ui/widgets/right_to_left_dismis.dart';

import '../providers/task_provider.dart';

class DissmisibleTask extends ConsumerWidget {
  late final todo;

  DissmisibleTask(this.todo, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          ref.read(todosProvider.notifier).toggle(todo.id);
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
            ref.read(todosProvider.notifier).toggle(todo.id);
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

// Widget swipeActionLeft(todo) => Container(
//       alignment: Alignment.centerLeft,
//       decoration: BoxDecoration(
//           color: const Color.fromRGBO(52, 199, 89, 1),
//           borderRadius: todo.id == 0
//               ? const BorderRadius.only(
//                   topLeft: Radius.circular(8), topRight: Radius.circular(8))
//               : null),
//       padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
//       child: const Icon(
//         Icons.check,
//         color: Colors.white,
//         size: 24,
//       ),
//     );
//
// Widget swipeActionRight(todo) => Container(
//       alignment: Alignment.centerRight,
//       decoration: BoxDecoration(
//           color: const Color.fromRGBO(255, 59, 48, 1),
//           borderRadius: todo.id == 0
//               ? const BorderRadius.only(
//                   topLeft: Radius.circular(8), topRight: Radius.circular(8))
//               : null),
//       padding: const EdgeInsets.fromLTRB(0, 0, 24, 0),
//       child: const Icon(
//         Icons.delete,
//         color: Colors.white,
//         size: 24,
//       ),
//     );
