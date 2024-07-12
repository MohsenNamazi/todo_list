import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/data/model/project/project.dart';
import 'package:todo_list/data/repository/projects_repository.dart';

part 'projects_view_cubit.freezed.dart';
part 'projects_view_state.dart';

class ProjectsViewCubit extends Cubit<ProjectsViewState> {
  ProjectsViewCubit({
    required ProjectsRepository repository,
  })  : _repository = repository,
        super(const ProjectsViewState.initial());

  final ProjectsRepository _repository;

  Future<void> _callEndpoint(Future<void> Function() call) async {
    final data = state.getData();
    try {
      await call();
    } catch (e, stackTrace) {
      emit(
        ProjectsViewState.error(
          error: e,
          stackTrace: stackTrace,
          projects: data,
        ),
      );
      addError(e, stackTrace);
    }
  }

  Future<void> getProjects() async {
    _callEndpoint(
      () async {
        emit(const ProjectsViewState.loading());
        final data = await _repository.getProjects();
        emit(ProjectsViewState.data(data));
      },
    );
  }

  Future<void> createProject(String name) async {
    final data = state.getData();
    _callEndpoint(
      () async {
        emit(const ProjectsViewState.loading());
        final project = await _repository.createProject(name: name);
        final updatedData = List<Project>.from(data)..add(project);
        emit(ProjectsViewState.data(updatedData));
      },
    );
  }

  Future<void> getProject(String id) async {
    final data = state.getData();
    _callEndpoint(
      () async {
        emit(const ProjectsViewState.loading());
        final project = await _repository.getProject(id: id);
        final updatedData = List<Project>.from(data)..add(project);
        emit(ProjectsViewState.data(updatedData));
      },
    );
  }

  Future<void> updateProject({
    required String id,
    String? name,
    String? color,
    String? viewStyle,
    bool? isFavorite,
  }) async {
    final data = state.getData();
    _callEndpoint(
      () async {
        emit(const ProjectsViewState.loading());
        final project = await _repository.updateProject(
          id: id,
          name: name,
          color: color,
          isFavorite: isFavorite,
          viewStyle: viewStyle,
        );
        final updatedData = data.map((p) => p.id == id ? project : p).toList();
        emit(ProjectsViewState.data(updatedData));
      },
    );
  }

  Future<void> deleteProject(String id) async {
    final data = state.getData();
    _callEndpoint(
      () async {
        emit(const ProjectsViewState.loading());
        await _repository.deleteProject(id: id);
        final updatedData = data.where((p) => p.id != id).toList();
        emit(ProjectsViewState.data(updatedData));
      },
    );
  }
}
