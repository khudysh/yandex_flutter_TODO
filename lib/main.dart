import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_task_manager/blocs/theme_bloc.dart';
import 'package:flutter_task_manager/settings/theme.dart';
import 'package:flutter_task_manager/widgets/app_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_manager/widgets/task_list_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  runApp(BlocProvider(create: (context) => ThemeBloc(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  // static SharedPreferences mainSharedPreferences = await SharedPreferences.getInstance();

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeBloc blocTheme = BlocProvider.of<ThemeBloc>(context);

    return BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, currentTheme) => MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                AppLocalizations.delegate, // Add this line
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en'), // English
                Locale('ru'), // Russian
              ],
              title: 'Flutter Demo',
              theme: currentTheme,
              home: TaskMainScreen(blocTheme),
            ));
  }
}

class TaskMainScreen extends StatelessWidget {
  late ThemeBloc _blocTheme;
  TaskMainScreen(ThemeBloc blocTheme, {super.key}) {
    _blocTheme = blocTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          AppLocalizations.of(context)!.app_bar_title,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: _blocTheme.state == kLightTheme
                ? IconButton(
                    icon: const Icon(Icons.dark_mode_outlined),
                    onPressed: () => {_blocTheme.add(DarkThemeEvent())},
                  )
                : IconButton(
                    icon: const Icon(Icons.light_mode_outlined),
                    onPressed: () {
                      return _blocTheme.add(LightThemeEvent());
                    },
                  ),
          )
        ],
      ),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        padding: const EdgeInsets.all(40.0),
        child: TaskListView(
          tasksPlaceholderTitle:
              AppLocalizations.of(context)!.tasks_placeholder_title,
        ),
      ),
    );
  }
}
