// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      id: json['id'] as String,
      taskId: json['task_id'] as String?,
      projectId: json['project_id'] as String?,
      postedAt: json['posted_at'] as String,
      content: json['content'] as String,
      attachment: json['attachment'] == null
          ? null
          : Attachment.fromJson(json['attachment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'task_id': instance.taskId,
      'project_id': instance.projectId,
      'posted_at': instance.postedAt,
      'content': instance.content,
      'attachment': instance.attachment,
    };
