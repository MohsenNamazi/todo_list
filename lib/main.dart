import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_list/app_router.dart';
import 'package:todo_list/dependency_injector/bloc_injector_provider.dart';
import 'package:todo_list/dependency_injector/injector.dart';
import 'package:todo_list/features/common/theme/color_theme.dart';
import 'package:todo_list/features/tasks/cubit/projects_cubit/projects_cubit.dart';
import 'package:todo_list/features/tasks/cubit/tasks_cubit/tasks_cubit.dart';

void main() {
  // initialize the injector
  Injector.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        InjectedBlocProvider<ProjectsCubit>(
          onCreate: (cubit) => cubit.getProjects(),
        ),
        InjectedBlocProvider<TasksCubit>(
          onCreate: (cubit) => cubit.getTasks(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('en'),
        //TODO(Mohsen): Make theme selectable by Cubit
        themeMode: ThemeMode.system,
        theme: lightTheme,
        darkTheme: darkTheme,
        routerConfig: inject<AppRouter>().config(),
      ),
    );
  }
}
