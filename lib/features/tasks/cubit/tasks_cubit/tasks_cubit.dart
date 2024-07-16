import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/data/model/task/task.dart';
import 'package:todo_list/data/model/new_task/new_task.dart';
import 'package:todo_list/data/model/tasks/tasks.dart';
import 'package:todo_list/data/model/update_task/update_task.dart';
import 'package:todo_list/data/model/task_filter/task_filter.dart';
import 'package:todo_list/data/repository/tasks_repository.dart';

part 'tasks_cubit.freezed.dart';
part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit({
    required TasksRepository repository,
  })  : _repository = repository,
        super(const TasksState.initial());

  final TasksRepository _repository;

  Future<void> _callEndpoint(Future<void> Function() call) async {
    final data = state.getData();
    try {
      await call();
    } catch (e, stackTrace) {
      emit(
        TasksState.error(
          error: e,
          stackTrace: stackTrace,
          tasks: data,
        ),
      );
      addError(e, stackTrace);
    }
  }

  Future<void> getTasks({TaskFilter? taskFilter}) async {
    await _callEndpoint(
      () async {
        emit(const TasksState.loading());
        final data = await _repository.getTasks(taskFilter: taskFilter);
        emit(TasksState.data(data));
      },
    );
  }

  Future<void> createTask(NewTaskBody newTaskBody) async {
    final data = state.getData();
    await _callEndpoint(
      () async {
        emit(const TasksState.loading());
        final task = await _repository.createTask(newTaskBody: newTaskBody);
        final updatedData = Tasks.from(data)..add(task);
        emit(TasksState.data(updatedData));
      },
    );
  }

  Future<void> getTask(String id) async {
    final data = state.getData();
    await _callEndpoint(
      () async {
        emit(const TasksState.loading());
        final task = await _repository.getTask(id: id);
        final updatedData = Tasks.from(data)..add(task);
        emit(TasksState.data(updatedData));
      },
    );
  }

  Future<void> updateTask({
    required String id,
    UpdateTaskBody? updateTask,
  }) async {
    final data = state.getData();
    await _callEndpoint(
      () async {
        emit(const TasksState.loading());
        final task =
            await _repository.updateTask(id: id, updateTask: updateTask);
        final updatedData = data.map((t) => t.id == id ? task : t).toList();
        emit(TasksState.data(updatedData));
      },
    );
  }

  Future<void> closeTask(String id) async {
    final data = state.getData();
    await _callEndpoint(
      () async {
        emit(const TasksState.loading());
        await _repository.closeTask(id: id);
        final updatedData = data
            .map((t) => t.id == id ? t.copyWith(isCompleted: true) : t)
            .toList();
        emit(TasksState.data(updatedData));
      },
    );
  }

  Future<void> reopenTask(String id) async {
    final data = state.getData();
    await _callEndpoint(
      () async {
        emit(const TasksState.loading());
        await _repository.reopenTask(id: id);
        final updatedData = data
            .map((t) => t.id == id ? t.copyWith(isCompleted: false) : t)
            .toList();
        emit(TasksState.data(updatedData));
      },
    );
  }

  Future<void> deleteTask(String id) async {
    final data = state.getData();
    await _callEndpoint(
      () async {
        emit(const TasksState.loading());
        await _repository.deleteTask(id: id);
        final updatedData = data.where((t) => t.id != id).toList();
        emit(TasksState.data(updatedData));
      },
    );
  }
}
