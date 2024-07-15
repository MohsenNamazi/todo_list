import 'package:flutter/material.dart';
import 'package:todo_list/data/model/task/task.dart';
import 'package:todo_list/dependency_injector/injector.dart';
import 'package:todo_list/features/common/consts/spacing.dart';
import 'package:todo_list/features/tasks/cubit/tasks_cubit/tasks_cubit.dart';

enum TasksStatus { todo, inProgress, done }

class TasksView extends StatelessWidget {
  const TasksView({
    required this.tasks,
    super.key,
  });

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _TasksListView(
            tasks.where((task) => !(task.isCompleted ?? false)).toList()),
        _TasksListView(
            tasks.where((task) => (task.isCompleted ?? false)).toList()),
      ],
    );
  }
}

class _TasksListView extends StatelessWidget {
  const _TasksListView(this.tasks);

  final List<Task> tasks;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Spacing.s50,
      child: ListView.builder(
        shrinkWrap: true,
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
