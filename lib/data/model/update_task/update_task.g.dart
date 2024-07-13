// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateTaskBodyImpl _$$UpdateTaskBodyImplFromJson(Map<String, dynamic> json) =>
    _$UpdateTaskBodyImpl(
      content: json['content'] as String?,
      description: json['description'] as String?,
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

Map<String, dynamic> _$$UpdateTaskBodyImplToJson(
        _$UpdateTaskBodyImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'description': instance.description,
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
