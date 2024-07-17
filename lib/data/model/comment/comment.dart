import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/data/model/attachment/attachment.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    required String id,
    @JsonKey(name: 'task_id') String? taskId,
    @JsonKey(name: 'project_id') String? projectId,
    @JsonKey(name: 'posted_at') required String postedAt,
    required String content,
    Attachment? attachment,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
