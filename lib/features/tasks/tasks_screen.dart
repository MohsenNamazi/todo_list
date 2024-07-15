import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/data/model/task/task.dart';
import 'package:todo_list/features/common/extensions/build_context.dart';
import 'package:todo_list/features/tasks/cubit/tasks_cubit/tasks_cubit.dart';
import 'package:todo_list/features/tasks/widgets/tasks_expandable_fab.dart';
import 'package:todo_list/features/tasks/widgets/tasks_filter_view.dart';
import 'package:todo_list/features/tasks/widgets/tasks_view.dart';
import 'package:todo_list/features/widgets/loading_indicator.dart';

@RoutePage()
class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      floatingActionButton: const TasksExpandableFab(),
      appBar: AppBar(
        title: Text(l10n.tasks),
      ),
      body: BlocConsumer<TasksCubit, TasksState>(
          listener: (BuildContext context, TasksState state) {
            // TODO(Mohsen): handle the error messages
            state.maybeWhen(
                error: (error, stackTrace, tasks) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(l10n.anErrorHappened)));
                },
                orElse: () => null);
          },
          builder: (context, state) => state.maybeWhen(
                data: (tasks) => _TasksDataWidget(tasks),
                error: (_, __, tasks) => _TasksDataWidget(tasks),
                orElse: () => const LoadingIndicator(),
              )),
    );
  }
}

class _TasksDataWidget extends StatelessWidget {
  const _TasksDataWidget(this.tasks);

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TasksFilterView(),
        Expanded(
          child: TasksView(tasks: tasks),
        ),
      ],
    );
  }
}
