import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/data/model/attachment/attachment.dart';

part 'new_comment.freezed.dart';
part 'new_comment.g.dart';

@freezed
class NewCommentBody with _$NewCommentBody {
  const factory NewCommentBody({
    @JsonKey(name: 'task_id') String? taskId,
    @JsonKey(name: 'project_id') String? projectId,
    required String content,
    Attachment? attachment,
  }) = _NewCommentBody;

  factory NewCommentBody.fromJson(Map<String, dynamic> json) =>
      _$NewCommentBodyFromJson(json);
}
