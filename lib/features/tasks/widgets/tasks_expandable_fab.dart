import 'package:flutter/material.dart';
import 'package:todo_list/app_router.dart';
import 'package:todo_list/dependency_injector/injector.dart';
import 'package:todo_list/features/common/consts/spacing.dart';
import 'package:todo_list/features/common/extensions/build_context.dart';
import 'package:todo_list/features/tasks/cubit/projects_cubit/projects_cubit.dart';
import 'package:todo_list/features/widgets/dialog.dart';
import 'package:todo_list/features/widgets/expandable_fab.dart';
import 'package:todo_list/features/widgets/text_field_dialog.dart';

enum FabActions { newTask, newProject }

class TasksExpandableFab extends StatefulWidget {
  const TasksExpandableFab({super.key});

  @override
  State<TasksExpandableFab> createState() => _TasksExpandableFabState();
}

class _TasksExpandableFabState extends State<TasksExpandableFab> {
  final _newProjectTaxtcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      distance: Spacing.s17,
      children: [
        ActionButton(
          onPressed: () => _showAction(context, FabActions.newTask),
          icon: const Icon(Icons.task),
        ),
        ActionButton(
          onPressed: () => _showAction(context, FabActions.newProject),
          icon: const Icon(Icons.tag),
        ),
      ],
    );
  }

  void _showAction(BuildContext context, FabActions action) {
    switch (action) {
      case FabActions.newTask:
        _createNewTask();
      case FabActions.newProject:
        _createNewProject(context);
    }
  }

  void _createNewProject(BuildContext context) {
    final l10n = context.l10n;
    TextFieldDialog.show(
      context,
      okLabel: l10n.add,
      cancelLabel: l10n.cancel,
      title: l10n.enterProjectName,
      controller: _newProjectTaxtcontroller,
      onPressed: (state) {
        if (_newProjectTaxtcontroller.text.trim() != '' &&
            state == AppDialogPressed.ok) {
          inject<ProjectsCubit>()
              .createProject(_newProjectTaxtcontroller.text.trim());
        }
        _newProjectTaxtcontroller.clear();
      },
    );
  }

  void _createNewTask() {
    inject<AppRouter>().push(const NewTaskRoute());
  }

  @override
  void dispose() {
    _newProjectTaxtcontroller.dispose();
    super.dispose();
  }
}
