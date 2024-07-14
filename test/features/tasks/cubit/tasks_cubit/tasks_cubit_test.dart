import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_list/data/model/task/task.dart';
import 'package:todo_list/data/model/new_task/new_task.dart';
import 'package:todo_list/data/model/update_task/update_task.dart';
import 'package:todo_list/features/tasks/cubit/tasks_cubit/tasks_cubit.dart';

import '../../../../data/model/task.dart';
import '../../../../mocks/tasks_repository_mock.dart';

class FakeNewTaskBody extends Fake implements NewTaskBody {}

class FakeUpdateTaskBody extends Fake implements UpdateTaskBody {}

void main() {
  late TasksRepositoryMock mockTasksRepository;
  late TasksCubit tasksCubit;
  late Task task;

  setUpAll(() {
    registerFallbackValue(FakeNewTaskBody());
    registerFallbackValue(FakeUpdateTaskBody());
  });

  setUp(() async {
    mockTasksRepository = TasksRepositoryMock();
    tasksCubit = TasksCubit(repository: mockTasksRepository);
    task = await TaskFake.getData();
  });

  tearDown(() {
    tasksCubit.close();
  });

  group('TasksCubit', () {
    blocTest<TasksCubit, TasksState>(
      'emits [loading, data] when getTasks is successful',
      setUp: () {
        when(() => mockTasksRepository.getTasks(
                taskFilter: any(named: 'taskFilter')))
            .thenAnswer((_) async => [task]);
      },
      build: () => tasksCubit,
      act: (cubit) => cubit.getTasks(),
      verify: (cubit) {
        final isSuccess = cubit.state.whenOrNull(data: (_) => true);
        expect(isSuccess, true);
        verify(() => mockTasksRepository.getTasks(
            taskFilter: any(named: 'taskFilter'))).called(1);
      },
    );

    blocTest<TasksCubit, TasksState>(
      'emits [loading, error] when getTasks fails',
      setUp: () {
        when(() => mockTasksRepository.getTasks(
                taskFilter: any(named: 'taskFilter')))
            .thenThrow(Exception('Failed to fetch tasks'));
      },
      build: () => tasksCubit,
      act: (cubit) => cubit.getTasks(),
      verify: (cubit) {
        final isError = cubit.state.whenOrNull(error: (_, __, ___) => true);
        expect(isError, true);
        verify(() => mockTasksRepository.getTasks(
            taskFilter: any(named: 'taskFilter'))).called(1);
      },
    );

    blocTest<TasksCubit, TasksState>(
      'emits [loading, data] when createTask is successful',
      setUp: () {
        when(() => mockTasksRepository.createTask(
                newTaskBody: any(named: 'newTaskBody')))
            .thenAnswer((_) async => task);
      },
      build: () => tasksCubit,
      act: (cubit) => cubit.createTask(const NewTaskBody(content: 'New Task')),
      verify: (cubit) {
        final isSuccess = cubit.state.whenOrNull(data: (_) => true);
        expect(isSuccess, true);
        verify(() => mockTasksRepository.createTask(
            newTaskBody: any(named: 'newTaskBody'))).called(1);
      },
    );

    blocTest<TasksCubit, TasksState>(
      'emits [loading, error] when createTask fails',
      setUp: () {
        when(() => mockTasksRepository.createTask(
                newTaskBody: any(named: 'newTaskBody')))
            .thenThrow(Exception('Failed to create task'));
      },
      build: () => tasksCubit,
      act: (cubit) => cubit.createTask(const NewTaskBody(content: 'New Task')),
      verify: (cubit) {
        final isError = cubit.state.whenOrNull(error: (_, __, ___) => true);
        expect(isError, true);
        verify(() => mockTasksRepository.createTask(
            newTaskBody: any(named: 'newTaskBody'))).called(1);
      },
    );

    blocTest<TasksCubit, TasksState>(
      'emits [loading, data] when getTask is successful',
      setUp: () {
        when(() => mockTasksRepository.getTask(id: any(named: 'id')))
            .thenAnswer((_) async => task);
      },
      build: () => tasksCubit,
      act: (cubit) => cubit.getTask('1'),
      verify: (cubit) {
        final isSuccess = cubit.state.whenOrNull(data: (_) => true);
        expect(isSuccess, true);
        verify(() => mockTasksRepository.getTask(id: any(named: 'id')))
            .called(1);
      },
    );

    blocTest<TasksCubit, TasksState>(
      'emits [loading, error] when getTask fails',
      setUp: () {
        when(() => mockTasksRepository.getTask(id: any(named: 'id')))
            .thenThrow(Exception('Failed to fetch task'));
      },
      build: () => tasksCubit,
      act: (cubit) => cubit.getTask('1'),
      verify: (cubit) {
        final isError = cubit.state.whenOrNull(error: (_, __, ___) => true);
        expect(isError, true);
        verify(() => mockTasksRepository.getTask(id: any(named: 'id')))
            .called(1);
      },
    );

    blocTest<TasksCubit, TasksState>(
      'emits [loading, data] when updateTask is successful',
      setUp: () {
        when(() => mockTasksRepository.updateTask(
              id: any(named: 'id'),
              updateTask: any(named: 'updateTask'),
            )).thenAnswer((_) async => task);
      },
      build: () => tasksCubit,
      act: (cubit) => cubit.updateTask(
          id: '1', updateTask: const UpdateTaskBody(content: 'Updated Task')),
      verify: (cubit) {
        final isSuccess = cubit.state.whenOrNull(data: (_) => true);
        expect(isSuccess, true);
        verify(() => mockTasksRepository.updateTask(
              id: any(named: 'id'),
              updateTask: any(named: 'updateTask'),
            )).called(1);
      },
    );

    blocTest<TasksCubit, TasksState>(
      'emits [loading, error] when updateTask fails',
      setUp: () {
        when(() => mockTasksRepository.updateTask(
              id: any(named: 'id'),
              updateTask: any(named: 'updateTask'),
            )).thenThrow(Exception('Failed to update task'));
      },
      build: () => tasksCubit,
      act: (cubit) => cubit.updateTask(
          id: '1', updateTask: const UpdateTaskBody(content: 'Updated Task')),
      verify: (cubit) {
        final isError = cubit.state.whenOrNull(error: (_, __, ___) => true);
        expect(isError, true);
        verify(() => mockTasksRepository.updateTask(
              id: any(named: 'id'),
              updateTask: any(named: 'updateTask'),
            )).called(1);
      },
    );

    blocTest<TasksCubit, TasksState>(
      'emits [loading, data] when closeTask is successful',
      setUp: () {
        when(() => mockTasksRepository.closeTask(id: any(named: 'id')))
            .thenAnswer((_) async => true);
      },
      build: () => tasksCubit,
      act: (cubit) => cubit.closeTask('1'),
      verify: (cubit) {
        final isSuccess = cubit.state.whenOrNull(data: (_) => true);
        expect(isSuccess, true);
        verify(() => mockTasksRepository.closeTask(id: any(named: 'id')))
            .called(1);
      },
    );

    blocTest<TasksCubit, TasksState>(
      'emits [loading, error] when closeTask fails',
      setUp: () {
        when(() => mockTasksRepository.closeTask(id: any(named: 'id')))
            .thenThrow(Exception('Failed to close task'));
      },
      build: () => tasksCubit,
      act: (cubit) => cubit.closeTask('1'),
      verify: (cubit) {
        final isError = cubit.state.whenOrNull(error: (_, __, ___) => true);
        expect(isError, true);
        verify(() => mockTasksRepository.closeTask(id: any(named: 'id')))
            .called(1);
      },
    );

    blocTest<TasksCubit, TasksState>(
      'emits [loading, data] when reopenTask is successful',
      setUp: () {
        when(() => mockTasksRepository.reopenTask(id: any(named: 'id')))
            .thenAnswer((_) async => true);
      },
      build: () => tasksCubit,
      act: (cubit) => cubit.reopenTask('1'),
      verify: (cubit) {
        final isSuccess = cubit.state.whenOrNull(data: (_) => true);
        expect(isSuccess, true);
        verify(() => mockTasksRepository.reopenTask(id: any(named: 'id')))
            .called(1);
      },
    );

    blocTest<TasksCubit, TasksState>(
      'emits [loading, error] when reopenTask fails',
      setUp: () {
        when(() => mockTasksRepository.reopenTask(id: any(named: 'id')))
            .thenThrow(Exception('Failed to reopen task'));
      },
      build: () => tasksCubit,
      act: (cubit) => cubit.reopenTask('1'),
      verify: (cubit) {
        final isError = cubit.state.whenOrNull(error: (_, __, ___) => true);
        expect(isError, true);
        verify(() => mockTasksRepository.reopenTask(id: any(named: 'id')))
            .called(1);
      },
    );
  });
}
