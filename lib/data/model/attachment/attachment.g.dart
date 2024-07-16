// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttachmentImpl _$$AttachmentImplFromJson(Map<String, dynamic> json) =>
    _$AttachmentImpl(
      fileName: json['fileName'] as String,
      fileType: json['fileType'] as String,
      fileUrl: json['fileUrl'] as String,
      resourceType: json['resourceType'] as String,
    );

Map<String, dynamic> _$$AttachmentImplToJson(_$AttachmentImpl instance) =>
    <String, dynamic>{
      'fileName': instance.fileName,
      'fileType': instance.fileType,
      'fileUrl': instance.fileUrl,
      'resourceType': instance.resourceType,
    };
