part of 'tasks_cubit.dart';

@freezed
class TasksState with _$TasksState {
  const factory TasksState.initial() = _Initial;
  const factory TasksState.loading() = _Loading;
  const factory TasksState.data(Tasks tasks) = _Data;
  const factory TasksState.error({
    required Object error,
    required StackTrace stackTrace,
    required Tasks tasks,
  }) = _Error;
}

extension TasksStateExtensions on TasksState {
  Tasks getData() => maybeWhen(
        data: (tasks) => tasks,
        error: (error, stackTrace, tasks) => tasks,
        orElse: () => [],
      );
}
