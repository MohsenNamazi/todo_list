import 'package:flutter/material.dart';
import 'package:todo_list/data/model/task_filter/task_filter.dart';
import 'package:todo_list/features/common/consts/spacing.dart';
import 'package:todo_list/features/common/extensions/build_context.dart';
import 'package:todo_list/features/tasks/widgets/list_title.dart';
import 'package:todo_list/features/widgets/project_selector.dart';

class TasksFilterView extends StatelessWidget {
  const TasksFilterView({
    required this.taskFilterNotifier,
    super.key,
  });

  final ValueNotifier<TaskFilter> taskFilterNotifier;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTitle(l10n.filterBy),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: Spacing.s4),
                ProjectSelector(
                  onChanged: (project) {
                    taskFilterNotifier.value = taskFilterNotifier.value
                        .copyWith(projectId: project?.id);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
