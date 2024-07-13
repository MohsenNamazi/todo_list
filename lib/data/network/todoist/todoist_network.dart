import 'package:dio/dio.dart';
import 'package:todo_list/data/model/new_task/new_task.dart';
import 'package:todo_list/data/model/project/project.dart';
import 'package:todo_list/data/model/task/task.dart';
import 'package:todo_list/data/model/task_filter/task_filter.dart';
import 'package:todo_list/data/model/update_task/update_task.dart';
import 'package:todo_list/data/network/dio/dio_request.dart';

class TodoistNetwork extends DioRequest {
  TodoistNetwork(Dio dio) : super(dio, 'https://api.todoist.com/rest/v2');

  // The API key just covers the free plan
  final requestHeader = {
    'Authorization': 'Bearer 121bb9208f93abf6be96d0f3ac245df91f700604',
  };

  // Get all projects
  Future<List<Project>> getProjects() async {
    final response = await setDioRequest<List<dynamic>>(
      url: '/projects',
      contentType: 'multipart/form-data',
      method: RequestMethod.get,
      headers: requestHeader,
    );
    List<dynamic> data = response.data!;
    return data.map((project) => Project.fromJson(project)).toList();
  }

  // Create a new project
  Future<Project> createProject({required String name}) async {
    final queryParameters = <String, dynamic>{
      'name': name,
    };
    final response = await setDioRequest<Map<String, dynamic>>(
      url: '/projects',
      contentType: 'multipart/form-data',
      method: RequestMethod.post,
      headers: requestHeader,
      queryParameters: queryParameters,
    );
    return Project.fromJson(response.data!);
  }

  // Get a project by id
  Future<Project> getProject({required String id}) async {
    final response = await setDioRequest<Map<String, dynamic>>(
      url: '/projects/$id',
      contentType: 'multipart/form-data',
      method: RequestMethod.get,
      headers: requestHeader,
    );
    return Project.fromJson(response.data!);
  }

  // Update the project
  Future<Project> updateProject({
    required String id,
    String? name,
    String? color,
    String? viewStyle,
    bool? isFavorite,
  }) async {
    final queryParameters = <String, dynamic>{
      'name': name,
      'color': color,
      'view_style': viewStyle,
      'is_favorite': isFavorite,
    }..removeWhere((k, v) => v == null);
    final response = await setDioRequest<Map<String, dynamic>>(
      url: '/projects/$id',
      contentType: 'multipart/form-data',
      method: RequestMethod.post,
      headers: requestHeader,
      queryParameters: queryParameters,
    );
    return Project.fromJson(response.data!);
  }

  // Delete a project by id
  Future<bool> deleteProject({required String id}) async {
    final response = await setDioRequest<bool>(
      url: '/projects/$id',
      contentType: 'multipart/form-data',
      method: RequestMethod.delete,
      headers: requestHeader,
    );
    if (response.statusCode != 204) {
      throw DioException.badResponse(
          statusCode: response.statusCode ?? 0,
          requestOptions: RequestOptions(),
          response: response);
    }
    return true;
  }

  // Get all tasks by optional filter
  Future<List<Task>> getTasks(TaskFilter? taskFilter) async {
    final queryParameters = taskFilter?.toJson()
      ?..removeWhere((k, v) => v == null);
    final response = await setDioRequest<List<dynamic>>(
      url: '/tasks',
      contentType: 'multipart/form-data',
      method: RequestMethod.get,
      headers: requestHeader,
      queryParameters: queryParameters,
    );
    List<dynamic> data = response.data!;
    return data.map((project) => Task.fromJson(project)).toList();
  }

  // Create a new task
  Future<Task> createTask({required NewTaskBody newTaskbody}) async {
    final queryParameters = newTaskbody.toJson()
      ..removeWhere((k, v) => v == null);
    final response = await setDioRequest<Map<String, dynamic>>(
      url: '/tasks',
      contentType: 'multipart/form-data',
      method: RequestMethod.post,
      headers: requestHeader,
      queryParameters: queryParameters,
    );
    return Task.fromJson(response.data!);
  }

  // Get a task id
  Future<Task> getTask({required String id}) async {
    final response = await setDioRequest<Map<String, dynamic>>(
      url: '/tasks/$id',
      contentType: 'multipart/form-data',
      method: RequestMethod.get,
      headers: requestHeader,
    );
    return Task.fromJson(response.data!);
  }

  // Update the task
  Future<Task> updateTask({
    required String id,
    UpdateTaskBody? updateTask,
  }) async {
    final queryParameters = updateTask?.toJson()
      ?..removeWhere((k, v) => v == null);
    final response = await setDioRequest<Map<String, dynamic>>(
      url: '/tasks/$id',
      contentType: 'multipart/form-data',
      method: RequestMethod.post,
      headers: requestHeader,
      queryParameters: queryParameters,
    );
    return Task.fromJson(response.data!);
  }

  // Close a project by id
  Future<bool> closeTask({required String id}) async {
    final response = await setDioRequest<bool>(
      url: '/tasks/$id/close',
      contentType: 'multipart/form-data',
      method: RequestMethod.post,
      headers: requestHeader,
    );
    if (response.statusCode != 204) {
      throw DioException.badResponse(
          statusCode: response.statusCode ?? 0,
          requestOptions: RequestOptions(),
          response: response);
    }
    return true;
  }

  // Close a project by id
  Future<bool> reopenTask({required String id}) async {
    final response = await setDioRequest<bool>(
      url: '/tasks/$id/reopen',
      contentType: 'multipart/form-data',
      method: RequestMethod.post,
      headers: requestHeader,
    );
    if (response.statusCode != 204) {
      throw DioException.badResponse(
          statusCode: response.statusCode ?? 0,
          requestOptions: RequestOptions(),
          response: response);
    }
    return true;
  }

  // Delete a project by id
  Future<bool> deleteTask({required String id}) async {
    final response = await setDioRequest<bool>(
      url: '/tasks/$id',
      contentType: 'multipart/form-data',
      method: RequestMethod.delete,
      headers: requestHeader,
    );
    if (response.statusCode != 204) {
      throw DioException.badResponse(
          statusCode: response.statusCode ?? 0,
          requestOptions: RequestOptions(),
          response: response);
    }
    return true;
  }
}
