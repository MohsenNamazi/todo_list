import 'package:dio/dio.dart';
import 'package:todo_list/data/model/project/project.dart';
import 'package:todo_list/data/network/dio/dio_request.dart';

class TodoistNetwork extends DioRequest {
  TodoistNetwork(Dio dio) : super(dio, 'https://api.todoist.com/rest/v2');

  // The API key just covers the free plan
  final requestHeader = {
    'Authorization': 'Bearer 121bb9208f93abf6be96d0f3ac245df91f700604',
  };

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

  Future<Project> getProject({required String id}) async {
    final response = await setDioRequest<Map<String, dynamic>>(
      url: '/projects/$id',
      contentType: 'multipart/form-data',
      method: RequestMethod.get,
      headers: requestHeader,
    );
    return Project.fromJson(response.data!);
  }

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
}
