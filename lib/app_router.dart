import 'package:auto_route/auto_route.dart';
import 'package:todo_list/features/new_task/new_task_screen.dart';
import 'package:todo_list/features/tasks/tasks_screen.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: TasksRoute.page, initial: true, path: '/tasks'),
        AutoRoute(page: NewTaskRoute.page, path: '/new_task'),
      ];
}
