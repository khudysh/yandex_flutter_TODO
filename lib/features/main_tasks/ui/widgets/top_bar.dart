import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_manager/features/main_tasks/ui/providers/task_provider.dart';
import 'package:flutter_task_manager/features/main_tasks/ui/task_screen.dart';

class TopBar extends ConsumerStatefulWidget {
  const TopBar({super.key});

  @override
  ConsumerState<TopBar> createState() => _MySliverBarState();
}

class _MySliverBarState extends ConsumerState<TopBar> {
  double top = 0;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      snap: false,
      floating: true,
      expandedHeight: 160,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          top = constraints.biggest.height;
          return FlexibleSpaceBar(
              expandedTitleScale: 1.6,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  top < MediaQuery.of(context).padding.top + kToolbarHeight + 15
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Мои дела',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                              child: IconButton(
                                  padding: EdgeInsets.zero,
                                  visualDensity: const VisualDensity(
                                    horizontal: 0,
                                    vertical: 0,
                                  ),
                                  splashRadius: 20,
                                  alignment: Alignment.center,
                                  iconSize: 24,
                                  constraints: const BoxConstraints(),
                                  color: const Color.fromRGBO(0, 122, 255, 1),
                                  onPressed: () {
                                    ref
                                        .read(todosProvider.notifier)
                                        .toggleShowCompleted();
                                  },
                                  icon: Icon(
                                    (ref
                                            .read(todosProvider.notifier)
                                            .showCompleted)
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  )),
                            )
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Мои дела',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Выполнено - ${ref.watch(todosProvider).todosCompleted}',
                                  style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(0, 0, 0, 0.3)),
                                ),
                                const SizedBox(
                                  width: 100,
                                ),
                                SizedBox(
                                  height: 23,
                                  width: 23,
                                  child: IconButton(
                                      padding: EdgeInsets.zero,
                                      iconSize: 15,
                                      color:
                                          const Color.fromRGBO(0, 122, 255, 1),
                                      onPressed: () {
                                        ref
                                            .read(todosProvider.notifier)
                                            .toggleShowCompleted();
                                      },
                                      icon: Icon(
                                        (ref
                                                .read(todosProvider.notifier)
                                                .showCompleted)
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      )),
                                )
                              ],
                            ),
                          ],
                        ),
                ],
              ));
        },
      ),
    );
  }
}
