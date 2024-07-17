import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_list/data/model/new_task/new_task.dart';
import 'package:todo_list/data/model/task_filter/task_filter.dart';
import 'package:todo_list/data/model/update_task/update_task.dart';
import 'package:todo_list/data/repository/tasks_repository.dart';

import '../../mocks/todoist_network_mock.dart';
import '../model/task.dart';

class NewTaskBodyFake extends Fake implements NewTaskBody {}

class UpdateTaskBodyFake extends Fake implements UpdateTaskBody {}

class TaskFilterFake extends Fake implements TaskFilter {}

void main() {
  late TodoistNetworkMock mockNetwork;
  late TasksRepository tasksRepository;

  const id = '2203306141';
  const content = 'Sample Task Content';

  setUpAll(() {
    registerFallbackValue(NewTaskBodyFake());
    registerFallbackValue(UpdateTaskBodyFake());
    registerFallbackValue(TaskFilterFake());
  });

  setUp(() {
    mockNetwork = TodoistNetworkMock();
    tasksRepository = TasksRepository(mockNetwork);
  });

  test('getTasks returns a list of tasks', () async {
    final tasks = [await TaskFake.getData()];

    when(() => mockNetwork.getTasks(any())).thenAnswer((_) async => tasks);

    final result =
        await tasksRepository.getTasks(taskFilter: const TaskFilter());

    expect(result, tasks);
    verify(() => mockNetwork.getTasks(any())).called(1);
  });

  test('createTask returns the created task', () async {
    final task = await TaskFake.getData();
    const newTaskBody = NewTaskBody(content: content);

    when(() => mockNetwork.createTask(newTaskbody: any(named: 'newTaskbody')))
        .thenAnswer((_) async => task);

    final result = await tasksRepository.createTask(newTaskBody: newTaskBody);

    expect(result, task);
    verify(() => mockNetwork.createTask(newTaskbody: any(named: 'newTaskbody')))
        .called(1);
  });

  test('getTask returns the task by id', () async {
    final task = await TaskFake.getData();

    when(() => mockNetwork.getTask(id: id)).thenAnswer((_) async => task);

    final result = await tasksRepository.getTask(id: id);

    expect(result, task);
    verify(() => mockNetwork.getTask(id: id)).called(1);
  });

  test('updateTask returns the updated task', () async {
    final task = await TaskFake.getData();
    const updateTaskBody = UpdateTaskBody(content: content);

    when(() => mockNetwork.updateTask(
        id: id,
        updateTask: any(named: 'updateTask'))).thenAnswer((_) async => task);

    final result =
        await tasksRepository.updateTask(id: id, updateTask: updateTaskBody);

    expect(result, task);
    verify(() => mockNetwork.updateTask(
        id: id, updateTask: any(named: 'updateTask'))).called(1);
  });

  test('closeTask returns true on successful close', () async {
    when(() => mockNetwork.closeTask(id: id)).thenAnswer((_) async => true);

    final result = await tasksRepository.closeTask(id: id);

    expect(result, true);
    verify(() => mockNetwork.closeTask(id: id)).called(1);
  });

  test('reopenTask returns true on successful reopen', () async {
    when(() => mockNetwork.reopenTask(id: id)).thenAnswer((_) async => true);

    final result = await tasksRepository.reopenTask(id: id);

    expect(result, true);
    verify(() => mockNetwork.reopenTask(id: id)).called(1);
  });

  test('deleteTask returns true on successful delete', () async {
    when(() => mockNetwork.deleteTask(id: id)).thenAnswer((_) async => true);

    final result = await tasksRepository.deleteTask(id: id);

    expect(result, true);
    verify(() => mockNetwork.deleteTask(id: id)).called(1);
  });

  test('deleteTask throws an exception on failed delete', () async {
    when(() => mockNetwork.deleteTask(id: id))
        .thenThrow(Exception('Failed to delete'));

    expect(
      () async => await tasksRepository.deleteTask(id: id),
      throwsA(isA<Exception>()),
    );
    verify(() => mockNetwork.deleteTask(id: id)).called(1);
  });
}
