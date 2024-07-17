import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_list/data/model/comment/comment.dart';
import 'package:todo_list/data/model/new_comment/new_comment.dart';
import 'package:todo_list/data/model/project/project.dart';
import 'package:todo_list/data/model/task/task.dart';
import 'package:todo_list/data/model/task_filter/task_filter.dart';
import 'package:todo_list/data/model/new_task/new_task.dart';
import 'package:todo_list/data/model/update_task/update_task.dart';
import 'package:todo_list/data/network/todoist/todoist_network.dart';

import '../../../mocks/dio_mock.dart';
import '../../model/file_loader.dart';

class MockDio extends Mock implements Dio {}

class FakeDioResponse extends Fake implements Response {
  @override
  final Map<String, dynamic>? data;

  FakeDioResponse({this.data});
}

void main() {
  const baseUrl = 'https://api.todoist.com/rest/v2';
  setUpAll(() {
    registerFallbackValue(FakeDioResponse());
  });

  group('TodoistNetwork - Projects', () {
    test('returns Projects on successful get Projects call', () async {
      final response = await FileLoader()
          .loadFile<List<dynamic>>('test/assets/projects.json');

      Dio dio =
          DioMock().mockData<List<dynamic>>('/projects', baseUrl, response);

      final todoistNetwork = TodoistNetwork(dio);

      final project =
          response.map((project) => Project.fromJson(project)).toList();

      final result = await todoistNetwork.getProjects();

      expect(result, equals(project));
    });

    test('returns Project on successful create Project call', () async {
      final response = await FileLoader()
          .loadFile<Map<String, dynamic>>('test/assets/project.json');

      const name = 'test';

      Dio dio = DioMock()
          .mockData<Map<String, dynamic>>('/projects', baseUrl, response);

      final todoistNetwork = TodoistNetwork(dio);

      final project = Project.fromJson(response);

      final result = await todoistNetwork.createProject(name: name);

      expect(result, equals(project));
    });

    test('returns Project on successful get Project call', () async {
      final response = await FileLoader()
          .loadFile<Map<String, dynamic>>('test/assets/project.json');

      const id = '2203306141';

      Dio dio = DioMock()
          .mockData<Map<String, dynamic>>('/projects/$id', baseUrl, response);

      final todoistNetwork = TodoistNetwork(dio);

      final project = Project.fromJson(response);

      final result = await todoistNetwork.getProject(id: project.id);

      expect(result, equals(project));
    });

    test('returns Project on successful update Project call', () async {
      final response = await FileLoader()
          .loadFile<Map<String, dynamic>>('test/assets/project.json');

      const id = '2203306141';

      Dio dio = DioMock()
          .mockData<Map<String, dynamic>>('/projects/$id', baseUrl, response);

      final todoistNetwork = TodoistNetwork(dio);

      final project = Project.fromJson(response);

      final result = await todoistNetwork.updateProject(
        id: project.id,
        name: 'test name',
        viewStyle: 'test view stype',
        isFavorite: false,
      );

      expect(result, equals(project));
    });

    test('returns Project on successful delete Project call', () async {
      const id = '2203306141';

      Dio dio = DioMock()
          .mockData<bool>('/projects/$id', baseUrl, true, statusCode: 204);

      final todoistNetwork = TodoistNetwork(dio);
      late bool isErrorHappened;
      try {
        await todoistNetwork.deleteProject(
          id: id,
        );
        isErrorHappened = false;
      } catch (e) {
        isErrorHappened = true;
      }
      expect(isErrorHappened, false);
    });

    test('returns Project on successful delete Project call', () async {
      const id = '2203306141';

      Dio dio = DioMock()
          .mockData<bool>('/projects/$id', baseUrl, true, statusCode: 400);

      final todoistNetwork = TodoistNetwork(dio);
      late bool isErrorHappened;
      try {
        await todoistNetwork.deleteProject(
          id: id,
        );
        isErrorHappened = false;
      } catch (e) {
        isErrorHappened = true;
      }
      expect(isErrorHappened, true);
    });
  });

  group('TodoistNetwork - Tasks', () {
    test('returns Tasks on successful get Tasks call', () async {
      final response =
          await FileLoader().loadFile<List<dynamic>>('test/assets/tasks.json');

      Dio dio = DioMock().mockData<List<dynamic>>('/tasks', baseUrl, response);

      final todoistNetwork = TodoistNetwork(dio);

      final tasks = response.map((task) => Task.fromJson(task)).toList();

      final result = await todoistNetwork.getTasks(const TaskFilter());

      expect(result, equals(tasks));
    });

    test('returns Task on successful create Task call', () async {
      final response = await FileLoader()
          .loadFile<Map<String, dynamic>>('test/assets/task.json');

      final newTaskBody = NewTaskBody.fromJson(response);

      Dio dio =
          DioMock().mockData<Map<String, dynamic>>('/tasks', baseUrl, response);

      final todoistNetwork = TodoistNetwork(dio);

      final task = Task.fromJson(response);

      final result = await todoistNetwork.createTask(newTaskbody: newTaskBody);

      expect(result, equals(task));
    });

    test('returns Task on successful get Task call', () async {
      final response = await FileLoader()
          .loadFile<Map<String, dynamic>>('test/assets/task.json');

      const id = '2995104339';

      Dio dio = DioMock()
          .mockData<Map<String, dynamic>>('/tasks/$id', baseUrl, response);

      final todoistNetwork = TodoistNetwork(dio);

      final task = Task.fromJson(response);

      final result = await todoistNetwork.getTask(id: task.id);

      expect(result, equals(task));
    });

    test('returns Task on successful update Task call', () async {
      final response = await FileLoader()
          .loadFile<Map<String, dynamic>>('test/assets/task.json');

      const id = '2995104339';

      Dio dio = DioMock()
          .mockData<Map<String, dynamic>>('/tasks/$id', baseUrl, response);

      final todoistNetwork = TodoistNetwork(dio);

      final task = Task.fromJson(response);

      final updateTaskBody = UpdateTaskBody.fromJson(response);

      final result = await todoistNetwork.updateTask(
        id: task.id,
        updateTask: updateTaskBody,
      );

      expect(result, equals(task));
    });

    test('returns true on successful close Task call', () async {
      const id = '2995104339';

      Dio dio = DioMock()
          .mockData<bool>('/tasks/$id/close', baseUrl, true, statusCode: 204);

      final todoistNetwork = TodoistNetwork(dio);
      late bool isErrorHappened;
      try {
        await todoistNetwork.closeTask(id: id);
        isErrorHappened = false;
      } catch (e) {
        isErrorHappened = true;
      }
      expect(isErrorHappened, false);
    });

    test('returns true on successful reopen Task call', () async {
      const id = '2995104339';

      Dio dio = DioMock()
          .mockData<bool>('/tasks/$id/reopen', baseUrl, true, statusCode: 204);

      final todoistNetwork = TodoistNetwork(dio);
      late bool isErrorHappened;
      try {
        await todoistNetwork.reopenTask(id: id);
        isErrorHappened = false;
      } catch (e) {
        isErrorHappened = true;
      }
      expect(isErrorHappened, false);
    });

    test('returns true on successful delete Task call', () async {
      const id = '2995104339';

      Dio dio = DioMock()
          .mockData<bool>('/tasks/$id', baseUrl, true, statusCode: 204);

      final todoistNetwork = TodoistNetwork(dio);
      late bool isErrorHappened;
      try {
        await todoistNetwork.deleteTask(id: id);
        isErrorHappened = false;
      } catch (e) {
        isErrorHappened = true;
      }
      expect(isErrorHappened, false);
    });

    test('returns error on unsuccessful delete Task call', () async {
      const id = '2995104339';

      Dio dio = DioMock()
          .mockData<bool>('/tasks/$id', baseUrl, true, statusCode: 400);

      final todoistNetwork = TodoistNetwork(dio);
      late bool isErrorHappened;
      try {
        await todoistNetwork.deleteTask(id: id);
        isErrorHappened = false;
      } catch (e) {
        isErrorHappened = true;
      }
      expect(isErrorHappened, true);
    });
  });

  group('TodoistNetwork - Comments', () {
    test('returns Comments on successful get Comments call', () async {
      final response = await FileLoader()
          .loadFile<List<dynamic>>('test/assets/comments.json');

      const taskId = '2995104339';

      Dio dio = DioMock().mockData<List<dynamic>>(
          '/comments', baseUrl, response,
          queryParameters: {'task_id': taskId});

      final todoistNetwork = TodoistNetwork(dio);

      final comments =
          response.map((comment) => Comment.fromJson(comment)).toList();

      final result = await todoistNetwork.getComments(taskId);

      expect(result, equals(comments));
    });

    test('returns Comment on successful create Comment call', () async {
      final response = await FileLoader()
          .loadFile<Map<String, dynamic>>('test/assets/comment.json');

      final newCommentBody = NewCommentBody.fromJson(response);

      Dio dio = DioMock().mockData<Map<String, dynamic>>(
          '/comments', baseUrl, response,
          queryParameters: newCommentBody.toJson());

      final todoistNetwork = TodoistNetwork(dio);

      final comment = Comment.fromJson(response);

      final result =
          await todoistNetwork.createComment(newCommentBody: newCommentBody);

      expect(result, equals(comment));
    });

    test('returns Comment on successful get Comment call', () async {
      final response = await FileLoader()
          .loadFile<Map<String, dynamic>>('test/assets/comment.json');

      const id = '2992679862';

      Dio dio = DioMock()
          .mockData<Map<String, dynamic>>('/comments/$id', baseUrl, response);

      final todoistNetwork = TodoistNetwork(dio);

      final comment = Comment.fromJson(response);

      final result = await todoistNetwork.getComment(id: comment.id);

      expect(result, equals(comment));
    });

    test('returns Comment on successful update Comment call', () async {
      final response = await FileLoader()
          .loadFile<Map<String, dynamic>>('test/assets/comment.json');

      const id = '2992679862';
      const content = 'Need one bottle of milk';

      Dio dio = DioMock().mockData<Map<String, dynamic>>(
          '/comments/$id', baseUrl, response,
          queryParameters: {'content': content});

      final todoistNetwork = TodoistNetwork(dio);

      final comment = Comment.fromJson(response);

      final result =
          await todoistNetwork.updateComment(id: comment.id, content: content);

      expect(result, equals(comment));
    });

    test('returns true on successful delete Comment call', () async {
      const id = '2992679862';

      Dio dio = DioMock()
          .mockData<bool>('/comments/$id', baseUrl, true, statusCode: 204);

      final todoistNetwork = TodoistNetwork(dio);
      late bool isErrorHappened;
      try {
        await todoistNetwork.deleteComment(id: id);
        isErrorHappened = false;
      } catch (e) {
        isErrorHappened = true;
      }
      expect(isErrorHappened, false);
    });

    test('returns error on unsuccessful delete Comment call', () async {
      const id = '2992679862';

      Dio dio = DioMock()
          .mockData<bool>('/comments/$id', baseUrl, true, statusCode: 400);

      final todoistNetwork = TodoistNetwork(dio);
      late bool isErrorHappened;
      try {
        await todoistNetwork.deleteComment(id: id);
        isErrorHappened = false;
      } catch (e) {
        isErrorHappened = true;
      }
      expect(isErrorHappened, true);
    });
  });
}
