import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/data/model/project/project.dart';
import 'package:todo_list/dependency_injector/injector.dart';
import 'package:todo_list/features/common/consts/spacing.dart';
import 'package:todo_list/features/common/extensions/build_context.dart';
import 'package:todo_list/features/common/theme/colors.dart';
import 'package:todo_list/features/projects/cubit/projects_view_cubit.dart';
import 'package:todo_list/features/widgets/dialog.dart';
import 'package:todo_list/features/widgets/loading_indicator.dart';
import 'package:todo_list/features/widgets/text_field_dialog.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView({super.key});

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.projects),
      ),
      body: BlocConsumer<ProjectsViewCubit, ProjectsViewState>(
          listener: (context, state) {
        //TODO(Mohsen): handle error messages
      }, builder: (context, state) {
        return state.maybeWhen(
          data: (projects) => _ProjectsList(projects),
          error: (projects, error, stackTrace) => _ProjectsList(projects),
          initial: () => const _InitialView(),
          orElse: () => const LoadingIndicator(),
        );
      }),
      floatingActionButton: FloatingActionButton(
        tooltip: l10n.addProjectsTooltip,
        onPressed: () => _addNewProject(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addNewProject(BuildContext context) {
    final l10n = context.l10n;
    TextFieldDialog.show(
      context,
      okLabel: l10n.add,
      cancelLabel: l10n.cancel,
      title: l10n.enterProjectName,
      controller: _controller,
      onPressed: (state) {
        if (_controller.text.trim() != '' && state == AppDialogPressed.ok) {
          inject<ProjectsViewCubit>().createProject(_controller.text.trim());
        }
        _controller.clear();
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _InitialView extends StatelessWidget {
  const _InitialView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: Center(
        child: Text(l10n.welcome),
      ),
    );
  }
}

class _ProjectsList extends StatelessWidget {
  const _ProjectsList(this.projects);
  final List<Project> projects;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];
        return Padding(
          padding: const EdgeInsets.all(Spacing.s2),
          child: ListTile(
              title: Text(project.name),
              subtitle: Text(project.commentCount.toString()),
              trailing: const Icon(Icons.arrow_circle_right),
              iconColor: Color(project.colorCode),
              tileColor: ColorPalettes.pink[50]),
        );
      },
    );
  }
}
