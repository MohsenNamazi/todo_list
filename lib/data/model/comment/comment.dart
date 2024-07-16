import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/data/model/attachment/attachment.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    required String id,
    String? taskId,
    String? projectId,
    required String postedAt,
    required String content,
    Attachment? attachment,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
