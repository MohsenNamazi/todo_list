import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/data/model/project/project.dart';
import 'package:todo_list/data/repository/projects_repository.dart';

part 'projects_cubit.freezed.dart';
part 'projects_state.dart';

class ProjectsCubit extends Cubit<ProjectsState> {
  ProjectsCubit({
    required ProjectsRepository repository,
  })  : _repository = repository,
        super(const ProjectsState.initial());

  final ProjectsRepository _repository;

  Future<void> _callEndpoint(Future<void> Function() call) async {
    final data = state.getData();
    try {
      await call();
    } catch (e, stackTrace) {
      emit(
        ProjectsState.error(
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
        emit(const ProjectsState.loading());
        final data = await _repository.getProjects();
        emit(ProjectsState.data(data));
      },
    );
  }

  Future<void> createProject(String name) async {
    final data = state.getData();
    _callEndpoint(
      () async {
        emit(const ProjectsState.loading());
        final project = await _repository.createProject(name: name);
        final updatedData = List<Project>.from(data)..add(project);
        emit(ProjectsState.data(updatedData));
      },
    );
  }

  Future<void> getProject(String id) async {
    final data = state.getData();
    _callEndpoint(
      () async {
        emit(const ProjectsState.loading());
        final project = await _repository.getProject(id: id);
        final updatedData = List<Project>.from(data)..add(project);
        emit(ProjectsState.data(updatedData));
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
        emit(const ProjectsState.loading());
        final project = await _repository.updateProject(
          id: id,
          name: name,
          color: color,
          isFavorite: isFavorite,
          viewStyle: viewStyle,
        );
        final updatedData = data.map((p) => p.id == id ? project : p).toList();
        emit(ProjectsState.data(updatedData));
      },
    );
  }

  Future<void> deleteProject(String id) async {
    final data = state.getData();
    _callEndpoint(
      () async {
        emit(const ProjectsState.loading());
        await _repository.deleteProject(id: id);
        final updatedData = data.where((p) => p.id != id).toList();
        emit(ProjectsState.data(updatedData));
      },
    );
  }
}
