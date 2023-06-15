import 'package:flutter/material.dart';

class LeftToRightDismis extends StatelessWidget {
  final todo;
  const LeftToRightDismis(this.todo, {super.key}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(52, 199, 89, 1),
          borderRadius: todo.id == 0
              ? const BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8))
              : null),
      padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
      child: const Icon(
        Icons.check,
        color: Colors.white,
        size: 24,
      ),
    );
  }
}
