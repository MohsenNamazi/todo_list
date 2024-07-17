import 'package:freezed_annotation/freezed_annotation.dart';

part 'attachment.freezed.dart';
part 'attachment.g.dart';

@freezed
class Attachment with _$Attachment {
  const factory Attachment({
    @JsonKey(name: 'file_name') required String fileName,
    @JsonKey(name: 'file_type') required String fileType,
    @JsonKey(name: 'file_url') required String fileUrl,
    @JsonKey(name: 'resource_type') required String resourceType,
  }) = _Attachment;

  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);
}
