import 'package:flutter/material.dart';
import 'package:todo_list/features/common/consts/spacing.dart';

enum TasksStatus { todo, inProgress, done }

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            TasksStatus.values.map((status) => _TasksColumn(status)).toList(),
      ),
    );
  }
}

class _TasksColumn extends StatelessWidget {
  const _TasksColumn(this._tasksStatus);

  final TasksStatus _tasksStatus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Spacing.s50,
      child: Container(
        color: Colors.red,
        child: Center(
          child: Text(_tasksStatus.name),
        ),
      ),
    );
  }
}
