import 'package:flutter/material.dart';
import 'package:todo_list/data/model/tasks/tasks.dart';
import 'package:todo_list/dependency_injector/injector.dart';
import 'package:todo_list/features/common/consts/spacing.dart';
import 'package:todo_list/features/common/extensions/build_context.dart';
import 'package:todo_list/features/tasks/cubit/tasks_cubit/tasks_cubit.dart';
import 'package:todo_list/features/tasks/widgets/list_title.dart';

class TasksView extends StatelessWidget {
  const TasksView({
    required this.tasks,
    super.key,
  });

  final Tasks tasks;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ListView(
      children: [
        ListTitle(
          l10n.todo,
          topPadding: Spacing.s4,
        ),
        _TasksListView(
            tasks.where((task) => !(task.isCompleted ?? false)).toList()),
        ListTitle(
          l10n.closed,
          topPadding: Spacing.s4,
        ),
        _TasksListView(
            tasks.where((task) => (task.isCompleted ?? false)).toList()),
      ],
    );
  }
}

class _TasksListView extends StatelessWidget {
  const _TasksListView(this.tasks);

  final Tasks tasks;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Spacing.s50,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          final hasDescription =
              task.description != null && task.description != '';

          return ListTile(
            title: Text(task.content ?? ''),
            subtitle: hasDescription
                ? Text(
                    task.description!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                : null,
            leading: Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              value: task.isCompleted,
              onChanged: (bool? isComplete) {
                if (isComplete ?? true) {
                  inject<TasksCubit>().closeTask(task.id);
                } else {
                  inject<TasksCubit>().reopenTask(task.id);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
