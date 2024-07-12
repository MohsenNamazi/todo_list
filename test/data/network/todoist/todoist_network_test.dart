import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_list/data/model/project/project.dart';
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

  group('TodoistNetwork', () {
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
}
