import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/data/model/project/project.dart';
import 'package:todo_list/data/model/task_filter/task_filter.dart';
import 'package:todo_list/features/common/consts/spacing.dart';
import 'package:todo_list/features/common/extensions/build_context.dart';
import 'package:todo_list/features/tasks/cubit/projects_cubit/projects_cubit.dart';

class TasksFilterView extends StatelessWidget {
  const TasksFilterView({
    required this.taskFilterNotifier,
    super.key,
  });

  final ValueNotifier<TaskFilter> taskFilterNotifier;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(width: Spacing.s4),
            _ProjectFilter(taskFilterNotifier),
            const SizedBox(width: Spacing.s4),
          ],
        ),
      ),
    );
  }
}

class _ProjectFilter extends StatefulWidget {
  const _ProjectFilter(this.taskFilterNotifier);
  final ValueNotifier<TaskFilter> taskFilterNotifier;

  @override
  State<_ProjectFilter> createState() => _ProjectFilterState();
}

class _ProjectFilterState extends State<_ProjectFilter> {
  Project? selectedProject;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final icon = selectedProject == null
        ? const Icon(Icons.keyboard_arrow_down)
        : InkWell(
            onTap: () {
              projectChanged(null);
              setState(() {
                selectedProject = null;
              });
            },
            child: const Icon(Icons.close));
    return BlocBuilder<ProjectsCubit, ProjectsState>(
      builder: (context, state) {
        final projects = state.getData();
        return DropdownButton<Project>(
          underline: const SizedBox.shrink(),
          value: selectedProject,
          icon: icon,
          iconSize: 24,
          elevation: 16,
          hint: Text(l10n.project),
          items: projects
              .map(
                (project) => DropdownMenuItem<Project>(
                  value: project,
                  child: Text(project.name ?? ''),
                ),
              )
              .toList(),
          onChanged: (Project? project) {
            projectChanged(project);
            setState(() {
              selectedProject = project;
            });
          },
        );
      },
    );
  }

  void projectChanged(Project? project) {
    widget.taskFilterNotifier.value =
        widget.taskFilterNotifier.value.copyWith(projectId: project?.id);
  }
}
