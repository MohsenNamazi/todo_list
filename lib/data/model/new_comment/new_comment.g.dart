// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewCommentBodyImpl _$$NewCommentBodyImplFromJson(Map<String, dynamic> json) =>
    _$NewCommentBodyImpl(
      taskId: json['task_id'] as String?,
      projectId: json['project_id'] as String?,
      content: json['content'] as String,
      attachment: json['attachment'] == null
          ? null
          : Attachment.fromJson(json['attachment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NewCommentBodyImplToJson(
        _$NewCommentBodyImpl instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'project_id': instance.projectId,
      'content': instance.content,
      'attachment': instance.attachment,
    };
