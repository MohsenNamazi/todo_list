// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['id'] as String,
      projectId: json['project_id'] as String?,
      sectionId: json['section_id'] as String?,
      content: json['content'] as String?,
      description: json['description'] as String?,
      isCompleted: json['is_completed'] as bool?,
      labels:
          (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
      parentId: json['parent_id'] as String?,
      order: (json['order'] as num?)?.toInt(),
      priority: (json['priority'] as num?)?.toInt(),
      due: json['due'] == null
          ? null
          : Due.fromJson(json['due'] as Map<String, dynamic>),
      url: json['url'] as String?,
      commentCount: (json['comment_count'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      creatorId: json['creator_id'] as String?,
      assigneeId: json['assignee_id'] as String?,
      assignerId: json['assigner_id'] as String?,
      duration: json['duration'] == null
          ? null
          : DurationModel.fromJson(json['duration'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_id': instance.projectId,
      'section_id': instance.sectionId,
      'content': instance.content,
      'description': instance.description,
      'is_completed': instance.isCompleted,
      'labels': instance.labels,
      'parent_id': instance.parentId,
      'order': instance.order,
      'priority': instance.priority,
      'due': instance.due,
      'url': instance.url,
      'comment_count': instance.commentCount,
      'created_at': instance.createdAt,
      'creator_id': instance.creatorId,
      'assignee_id': instance.assigneeId,
      'assigner_id': instance.assignerId,
      'duration': instance.duration,
    };
