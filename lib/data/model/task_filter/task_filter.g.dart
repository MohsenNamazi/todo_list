// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskFilterImpl _$$TaskFilterImplFromJson(Map<String, dynamic> json) =>
    _$TaskFilterImpl(
      projectId: json['projectId'] as String?,
      sectionId: json['sectionId'] as String?,
      label: json['label'] as String?,
      filter: json['filter'] as String?,
      lang: json['lang'] as String?,
      ids: (json['ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$TaskFilterImplToJson(_$TaskFilterImpl instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'sectionId': instance.sectionId,
      'label': instance.label,
      'filter': instance.filter,
      'lang': instance.lang,
      'ids': instance.ids,
    };
