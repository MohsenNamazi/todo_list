import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/data/model/task_filter/task_filter.dart';
import 'package:todo_list/features/common/extensions/build_context.dart';
import 'package:todo_list/features/tasks/cubit/tasks_cubit/tasks_cubit.dart';
import 'package:todo_list/features/tasks/widgets/tasks_expandable_fab.dart';
import 'package:todo_list/features/tasks/widgets/tasks_filter_view.dart';
import 'package:todo_list/features/tasks/widgets/tasks_view.dart';
import 'package:todo_list/features/widgets/loading_indicator.dart';

@RoutePage()
class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  ValueNotifier<TaskFilter> taskFilterNotifier =
      ValueNotifier(const TaskFilter());
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      floatingActionButton: const TasksExpandableFab(),
      appBar: AppBar(
        title: Text(l10n.tasks),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TasksFilterView(taskFilterNotifier: taskFilterNotifier),
          Expanded(
            child: ValueListenableBuilder(
                valueListenable: taskFilterNotifier,
                builder: (context, taskFilter, _) {
                  return BlocConsumer<TasksCubit, TasksState>(
                      listener: (BuildContext context, TasksState state) {
                        // TODO(Mohsen): handle the error messages
                        state.maybeWhen(
                            error: (error, stackTrace, tasks) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(l10n.anErrorHappened)));
                            },
                            orElse: () => null);
                      },
                      builder: (context, state) => state.maybeWhen(
                            data: (tasks) => TasksView(
                              tasks: tasks,
                            ),
                            error: (_, __, tasks) => TasksView(
                              tasks: tasks,
                            ),
                            orElse: () => const LoadingIndicator(),
                          ));
                }),
          ),
        ],
      ),
    );
  }
}
