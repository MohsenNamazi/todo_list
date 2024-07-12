part of 'projects_view_cubit.dart';

@freezed
class ProjectsViewState with _$ProjectsViewState {
  const factory ProjectsViewState.initial() = _Initial;
  const factory ProjectsViewState.loading() = _Loading;
  const factory ProjectsViewState.data(List<Project> projects) = _Data;
  const factory ProjectsViewState.error({
    required List<Project> projects,
    Object? error,
    StackTrace? stackTrace,
  }) = _Error;
}

extension ProjectsViewStateExtensions on ProjectsViewState {
  List<Project> getData() => maybeWhen(
      data: (projects) => projects,
      error: (projects, error, stackTrace) => projects,
      orElse: () => []);
}
