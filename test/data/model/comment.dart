import 'package:todo_list/data/model/comment/comment.dart';

import 'file_loader.dart';

abstract class CommentFake {
  static Future<Comment> getData() async {
    final testData = await FileLoader().loadFile('test/assets/comment.json');
    return Comment.fromJson(testData);
  }
}
