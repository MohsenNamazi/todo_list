import 'package:todo_list/data/model/comment/comment.dart';
import 'package:todo_list/data/model/new_comment/new_comment.dart';
import 'package:todo_list/data/network/todoist/todoist_network.dart';

class CommentsRepository {
  CommentsRepository(this._network);
  final TodoistNetwork _network;

  Future<List<Comment>> getComments(String taskId) async {
    return await _network.getComments(taskId);
  }

  Future<Comment> createComment({required NewCommentBody body}) async {
    return await _network.createComment(newCommentBody: body);
  }

  Future<Comment> getComment({required String id}) async {
    return await _network.getComment(id: id);
  }

  Future<Comment> updateComment({
    required String id,
    required String content,
  }) async {
    return await _network.updateComment(id: id, content: content);
  }

  Future<bool> deleteComment({required String id}) async {
    return await _network.deleteComment(id: id);
  }
}
