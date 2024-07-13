import 'package:todo_list/data/model/new_task/new_task.dart';
import 'package:todo_list/data/model/task/task.dart';
import 'package:todo_list/data/model/task_filter/task_filter.dart';
import 'package:todo_list/data/model/update_task/update_task.dart';
import 'package:todo_list/data/network/todoist/todoist_network.dart';

class TasksRepository {
  TasksRepository(this._network);
  final TodoistNetwork _network;

  Future<List<Task>> getTasks({TaskFilter? taskFilter}) async {
    return await _network.getTasks(taskFilter);
  }

  Future<Task> createTask({required NewTaskBody newTaskBody}) async {
    return await _network.createTask(newTaskbody: newTaskBody);
  }

  Future<Task> getTask({required String id}) async {
    return await _network.getTask(id: id);
  }

  Future<Task> updateTask(
      {required String id, UpdateTaskBody? updateTask}) async {
    return await _network.updateTask(id: id, updateTask: updateTask);
  }

  Future<bool> closeTask({required String id}) async {
    return await _network.closeTask(id: id);
  }

  Future<bool> reopenTask({required String id}) async {
    return await _network.reopenTask(id: id);
  }

  Future<bool> deleteTask({required String id}) async {
    return await _network.deleteTask(id: id);
  }
}
