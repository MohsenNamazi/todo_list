// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      id: json['id'] as String,
      taskId: json['taskId'] as String?,
      projectId: json['projectId'] as String?,
      postedAt: json['postedAt'] as String,
      content: json['content'] as String,
      attachment: json['attachment'] == null
          ? null
          : Attachment.fromJson(json['attachment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taskId': instance.taskId,
      'projectId': instance.projectId,
      'postedAt': instance.postedAt,
      'content': instance.content,
      'attachment': instance.attachment,
    };
