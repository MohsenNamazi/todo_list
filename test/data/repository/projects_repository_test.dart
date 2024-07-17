import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_list/data/repository/projects_repository.dart';

import '../../mocks/todoist_network_mock.dart';
import '../model/project.dart';

void main() {
  late TodoistNetworkMock mockNetwork;
  late ProjectsRepository projectsRepository;

  const id = '2203306141';
  const name = 'Things to buy';

  setUp(() {
    mockNetwork = TodoistNetworkMock();
    projectsRepository = ProjectsRepository(mockNetwork);
  });

  test('getProjects returns a list of projects', () async {
    final projects = [await ProjectFake.getData()];

    when(() => mockNetwork.getProjects()).thenAnswer((_) async => projects);

    final result = await projectsRepository.getProjects();

    expect(result, projects);
    verify(() => mockNetwork.getProjects()).called(1);
  });

  test('createProject returns the created project', () async {
    final project = await ProjectFake.getData();

    when(() => mockNetwork.createProject(name: name))
        .thenAnswer((_) async => project);

    final result = await projectsRepository.createProject(name: name);

    expect(result, project);
    verify(() => mockNetwork.createProject(name: name)).called(1);
  });

  test('getProject returns the project by id', () async {
    final project = await ProjectFake.getData();

    when(() => mockNetwork.getProject(id: id)).thenAnswer((_) async => project);

    final result = await projectsRepository.getProject(id: id);

    expect(result, project);
    verify(() => mockNetwork.getProject(id: id)).called(1);
  });

  test('updateProject returns the updated project', () async {
    final project = await ProjectFake.getData();

    when(() => mockNetwork.updateProject(
          id: id,
          name: name,
          color: null,
          isFavorite: null,
          viewStyle: null,
        )).thenAnswer((_) async => project);

    final result = await projectsRepository.updateProject(id: id, name: name);

    expect(result, project);
    verify(() => mockNetwork.updateProject(
          id: id,
          name: name,
          color: null,
          isFavorite: null,
          viewStyle: null,
        )).called(1);
  });

  test('deleteProject returns true on successful delete', () async {
    when(() => mockNetwork.deleteProject(id: id)).thenAnswer((_) async => true);

    final result = await projectsRepository.deleteProject(id: id);

    expect(result, true);
    verify(() => mockNetwork.deleteProject(id: id)).called(1);
  });

  test('deleteProject throws an exception on failed delete', () async {
    when(() => mockNetwork.deleteProject(id: id))
        .thenThrow(Exception('Failed to delete'));

    expect(
      () async => await projectsRepository.deleteProject(id: id),
      throwsA(isA<Exception>()),
    );
    verify(() => mockNetwork.deleteProject(id: id)).called(1);
  });
}
