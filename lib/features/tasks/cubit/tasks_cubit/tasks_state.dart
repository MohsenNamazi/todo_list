part of 'tasks_cubit.dart';

@freezed
class TasksState with _$TasksState {
  const factory TasksState.initial() = _Initial;
  const factory TasksState.loading() = _Loading;
  const factory TasksState.data(List<Task> tasks) = _Data;
  const factory TasksState.error({
    required Object error,
    required StackTrace stackTrace,
    required List<Task> tasks,
  }) = _Error;

  List<Task> getData() => maybeWhen(
        data: (tasks) => tasks,
        error: (error, stackTrace, tasks) => tasks,
        orElse: () => [],
      );
}
