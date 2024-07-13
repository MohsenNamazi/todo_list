import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/features/common/extensions/build_context.dart';
import 'package:todo_list/features/tasks/widgets/tasks_expandable_fab.dart';

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
      body: const Placeholder(),
    );
  }
}
