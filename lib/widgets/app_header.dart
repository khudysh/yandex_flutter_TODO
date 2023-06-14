import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final String mainScreenTitle;
  bool isFormShow = false;
  AppHeader({super.key, required this.mainScreenTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(mainScreenTitle,
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
                  onPressed: () => {},
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
                onEditingComplete: () => {},
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              )
            : Container()
      ],
    );
  }
}
