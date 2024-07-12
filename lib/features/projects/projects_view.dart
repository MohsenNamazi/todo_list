import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/data/model/project/project.dart';
import 'package:todo_list/features/projects/cubit/projects_view_cubit.dart';
import 'package:todo_list/features/widgets/loading_indicator.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProjectsViewCubit, ProjectsViewState>(
          listener: (context, state) {},
          builder: (context, state) {
            return state.maybeWhen(
              data: (projects) => _ProjectsList(projects),
              error: (projects, error, stackTrace) => _ProjectsList(projects),
              orElse: () => const LoadingIndicator(),
            );
          }),
    );
  }
}

class _ProjectsList extends StatelessWidget {
  const _ProjectsList(this.projects);
  final List<Project> projects;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
