import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_list/data/model/project/project.dart';
import 'package:todo_list/features/tasks/cubit/projects_cubit/projects_cubit.dart';

import '../../../../data/model/project.dart';
import '../../../../mocks/projects_repository_mock.dart';

void main() {
  late ProjectsRepositoryMock mockProjectsRepository;
  late ProjectsCubit projectsCubit;
  late Project project;

  setUp(() async {
    mockProjectsRepository = ProjectsRepositoryMock();
    projectsCubit = ProjectsCubit(repository: mockProjectsRepository);
    project = await ProjectFake.getData();
  });

  tearDown(() {
    projectsCubit.close();
  });

  group(' projectsCubit', () {
    blocTest<ProjectsCubit, ProjectsState>(
      'emits [loading, data] when getProjects is successful',
      setUp: () {
        when(() => mockProjectsRepository.getProjects())
            .thenAnswer((_) async => [project]);
      },
      build: () => projectsCubit,
      act: (cubit) => cubit.getProjects(),
      verify: (cubit) {
        final isSuccess = cubit.state.whenOrNull(data: (_) => true);
        expect(isSuccess, true);
        verify(() => mockProjectsRepository.getProjects()).called(1);
      },
    );

    blocTest<ProjectsCubit, ProjectsState>(
      'emits [loading, error] when getProjects fails',
      setUp: () {
        when(() => mockProjectsRepository.getProjects())
            .thenThrow(Exception('Failed to fetch projects'));
      },
      build: () => projectsCubit,
      act: (cubit) => cubit.getProjects(),
      verify: (cubit) {
        final isError = cubit.state.whenOrNull(error: (_, __, ___) => true);
        expect(isError, true);
        verify(() => mockProjectsRepository.getProjects()).called(1);
      },
    );

    blocTest<ProjectsCubit, ProjectsState>(
      'emits [loading, data] when createProject is successful',
      setUp: () {
        when(() =>
                mockProjectsRepository.createProject(name: any(named: 'name')))
            .thenAnswer((_) async => project);
      },
      build: () => projectsCubit,
      act: (cubit) => cubit.createProject('New Project'),
      verify: (cubit) {
        final isSuccess = cubit.state.whenOrNull(data: (_) => true);
        expect(isSuccess, true);
        verify(() =>
                mockProjectsRepository.createProject(name: any(named: 'name')))
            .called(1);
      },
    );

    blocTest<ProjectsCubit, ProjectsState>(
      'emits [loading, error] when createProject fails',
      setUp: () {
        when(() =>
                mockProjectsRepository.createProject(name: any(named: 'name')))
            .thenThrow(Exception('Failed to create project'));
      },
      build: () => projectsCubit,
      act: (cubit) => cubit.createProject('New Project'),
      verify: (cubit) {
        final isError = cubit.state.whenOrNull(error: (_, __, ___) => true);
        expect(isError, true);
        verify(() =>
                mockProjectsRepository.createProject(name: any(named: 'name')))
            .called(1);
      },
    );

    blocTest<ProjectsCubit, ProjectsState>(
      'emits [loading, data] when updateProject is successful',
      setUp: () {
        when(() => mockProjectsRepository.updateProject(
              id: any(named: 'id'),
              name: any(named: 'name'),
              color: any(named: 'color'),
              viewStyle: any(named: 'viewStyle'),
              isFavorite: any(named: 'isFavorite'),
            )).thenAnswer((_) async => project);
      },
      build: () => projectsCubit,
      act: (cubit) => cubit.updateProject(id: '1', name: 'Updated Project'),
      verify: (cubit) {
        final isSuccess = cubit.state.whenOrNull(data: (_) => true);
        expect(isSuccess, true);
        verify(() => mockProjectsRepository.updateProject(
              id: any(named: 'id'),
              name: any(named: 'name'),
              color: any(named: 'color'),
              viewStyle: any(named: 'viewStyle'),
              isFavorite: any(named: 'isFavorite'),
            )).called(1);
      },
    );

    blocTest<ProjectsCubit, ProjectsState>(
      'emits [loading, error] when updateProject fails',
      setUp: () {
        when(() => mockProjectsRepository.updateProject(
              id: any(named: 'id'),
              name: any(named: 'name'),
              color: any(named: 'color'),
              viewStyle: any(named: 'viewStyle'),
              isFavorite: any(named: 'isFavorite'),
            )).thenThrow(Exception('Failed to update project'));
      },
      build: () => projectsCubit,
      act: (cubit) => cubit.updateProject(id: '1', name: 'Updated Project'),
      verify: (cubit) {
        final isError = cubit.state.whenOrNull(error: (_, __, ___) => true);
        expect(isError, true);
        verify(() => mockProjectsRepository.updateProject(
              id: any(named: 'id'),
              name: any(named: 'name'),
              color: any(named: 'color'),
              viewStyle: any(named: 'viewStyle'),
              isFavorite: any(named: 'isFavorite'),
            )).called(1);
      },
    );

    blocTest<ProjectsCubit, ProjectsState>(
      'emits [loading, data] when deleteProject is successful',
      setUp: () {
        when(() => mockProjectsRepository.deleteProject(id: any(named: 'id')))
            .thenAnswer((_) async => true);
      },
      build: () => projectsCubit,
      act: (cubit) => cubit.deleteProject('2203306141'),
      verify: (cubit) {
        final isSuccess = cubit.state.whenOrNull(data: (_) => true);
        expect(isSuccess, true);
        verify(() => mockProjectsRepository.deleteProject(id: any(named: 'id')))
            .called(1);
      },
    );

    blocTest<ProjectsCubit, ProjectsState>(
      'emits [loading, error] when deleteProject fails',
      setUp: () {
        when(() => mockProjectsRepository.deleteProject(id: any(named: 'id')))
            .thenThrow(Exception('Failed to delete project'));
      },
      build: () => projectsCubit,
      act: (cubit) => cubit.deleteProject('2203306141'),
      verify: (cubit) {
        final isError = cubit.state.whenOrNull(error: (_, __, ___) => true);
        expect(isError, true);
        verify(() => mockProjectsRepository.deleteProject(id: any(named: 'id')))
            .called(1);
      },
    );
  });
}
