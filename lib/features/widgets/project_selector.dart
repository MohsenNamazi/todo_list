import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/data/model/project/project.dart';
import 'package:todo_list/features/common/extensions/build_context.dart';
import 'package:todo_list/features/tasks/cubit/projects_cubit/projects_cubit.dart';

class ProjectSelector extends StatefulWidget {
  const ProjectSelector({required this.onChanged, super.key});
  final Function(Project?) onChanged;

  @override
  State<ProjectSelector> createState() => _ProjectSelectorState();
}

class _ProjectSelectorState extends State<ProjectSelector> {
  Project? selectedProject;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final icon = selectedProject == null
        ? const Icon(Icons.keyboard_arrow_down)
        : InkWell(
            onTap: () {
              widget.onChanged(null);
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
            widget.onChanged(project);
            setState(() {
              selectedProject = project;
            });
          },
        );
      },
    );
  }
}
