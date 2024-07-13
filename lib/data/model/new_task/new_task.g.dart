// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewTaskBodyImpl _$$NewTaskBodyImplFromJson(Map<String, dynamic> json) =>
    _$NewTaskBodyImpl(
      content: json['content'] as String,
      description: json['description'] as String?,
      projectId: json['projectId'] as String?,
      sectionId: json['sectionId'] as String?,
      parentId: json['parentId'] as String?,
      order: (json['order'] as num?)?.toInt(),
      labels:
          (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
      priority: (json['priority'] as num?)?.toInt(),
      dueString: json['dueString'] as String?,
      dueDate: json['dueDate'] as String?,
      dueDatetime: json['dueDatetime'] as String?,
      dueLang: json['dueLang'] as String?,
      assigneeId: json['assigneeId'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      durationUnit: json['durationUnit'] as String?,
    );

Map<String, dynamic> _$$NewTaskBodyImplToJson(_$NewTaskBodyImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'description': instance.description,
      'projectId': instance.projectId,
      'sectionId': instance.sectionId,
      'parentId': instance.parentId,
      'order': instance.order,
      'labels': instance.labels,
      'priority': instance.priority,
      'dueString': instance.dueString,
      'dueDate': instance.dueDate,
      'dueDatetime': instance.dueDatetime,
      'dueLang': instance.dueLang,
      'assigneeId': instance.assigneeId,
      'duration': instance.duration,
      'durationUnit': instance.durationUnit,
    };
