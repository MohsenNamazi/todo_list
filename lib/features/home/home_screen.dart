import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/data/network/todoist/todoist_network.dart';
import 'package:todo_list/dependency_injector/injector.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            child: const Text('getProjects'),
            onPressed: () async {
              final projects = await inject<TodoistNetwork>().getProjects();
              debugPrint(projects.toString());
            },
          ),
          TextButton(
            child: const Text('createProject'),
            onPressed: () {
              inject<TodoistNetwork>().createProject(name: 'new test');
            },
          ),
          TextButton(
            child: const Text('getProject'),
            onPressed: () async {
              final project =
                  await inject<TodoistNetwork>().getProject(id: '2336120960');
              debugPrint(project.toString());
            },
          ),
          TextButton(
            child: const Text('updateProject'),
            onPressed: () async {
              final newProject = await inject<TodoistNetwork>().updateProject(
                id: '2336120960',
                name: 'test 2',
              );
              debugPrint(newProject.toString());
            },
          ),
          TextButton(
            child: const Text('deleteProject'),
            onPressed: () {
              inject<TodoistNetwork>().deleteProject(id: '2336128968');
            },
          ),
        ],
      ),
    );
  }
}
