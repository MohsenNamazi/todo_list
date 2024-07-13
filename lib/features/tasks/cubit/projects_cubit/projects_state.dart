part of 'projects_cubit.dart';

@freezed
class ProjectsState with _$ProjectsState {
  const factory ProjectsState.initial() = _Initial;
  const factory ProjectsState.loading() = _Loading;
  const factory ProjectsState.data(List<Project> projects) = _Data;
  const factory ProjectsState.error({
    required List<Project> projects,
    Object? error,
    StackTrace? stackTrace,
  }) = _Error;
}

extension ProjectsStateExtensions on ProjectsState {
  List<Project> getData() => maybeWhen(
      data: (projects) => projects,
      error: (projects, error, stackTrace) => projects,
      orElse: () => []);
}
