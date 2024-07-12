import 'package:todo_list/data/model/project/project.dart';
import 'package:todo_list/data/network/todoist/todoist_network.dart';

class ProjectsRepository {
  ProjectsRepository(this._network);
  final TodoistNetwork _network;

  Future<List<Project>> getProjects() async {
    return await _network.getProjects();
  }

  Future<Project> createProject({required String name}) async {
    return await _network.createProject(name: name);
  }

  Future<Project> getProject({required String id}) async {
    return await _network.getProject(id: id);
  }

  Future<Project> updateProject({
    required String id,
    String? name,
    String? color,
    String? viewStyle,
    bool? isFavorite,
  }) async {
    return _network.updateProject(
      id: id,
      name: name,
      color: color,
      isFavorite: isFavorite,
      viewStyle: viewStyle,
    );
  }

  Future<bool> deleteProject({required String id}) async {
    return await _network.deleteProject(id: id);
  }
}
