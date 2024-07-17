// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewCommentBody _$NewCommentBodyFromJson(Map<String, dynamic> json) {
  return _NewCommentBody.fromJson(json);
}

/// @nodoc
mixin _$NewCommentBody {
  @JsonKey(name: 'task_id')
  String? get taskId => throw _privateConstructorUsedError;
  @JsonKey(name: 'project_id')
  String? get projectId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  Attachment? get attachment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewCommentBodyCopyWith<NewCommentBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewCommentBodyCopyWith<$Res> {
  factory $NewCommentBodyCopyWith(
          NewCommentBody value, $Res Function(NewCommentBody) then) =
      _$NewCommentBodyCopyWithImpl<$Res, NewCommentBody>;
  @useResult
  $Res call(
      {@JsonKey(name: 'task_id') String? taskId,
      @JsonKey(name: 'project_id') String? projectId,
      String content,
      Attachment? attachment});

  $AttachmentCopyWith<$Res>? get attachment;
}

/// @nodoc
class _$NewCommentBodyCopyWithImpl<$Res, $Val extends NewCommentBody>
    implements $NewCommentBodyCopyWith<$Res> {
  _$NewCommentBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = freezed,
    Object? projectId = freezed,
    Object? content = null,
    Object? attachment = freezed,
  }) {
    return _then(_value.copyWith(
      taskId: freezed == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      attachment: freezed == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as Attachment?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AttachmentCopyWith<$Res>? get attachment {
    if (_value.attachment == null) {
      return null;
    }

    return $AttachmentCopyWith<$Res>(_value.attachment!, (value) {
      return _then(_value.copyWith(attachment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NewCommentBodyImplCopyWith<$Res>
    implements $NewCommentBodyCopyWith<$Res> {
  factory _$$NewCommentBodyImplCopyWith(_$NewCommentBodyImpl value,
          $Res Function(_$NewCommentBodyImpl) then) =
      __$$NewCommentBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'task_id') String? taskId,
      @JsonKey(name: 'project_id') String? projectId,
      String content,
      Attachment? attachment});

  @override
  $AttachmentCopyWith<$Res>? get attachment;
}

/// @nodoc
class __$$NewCommentBodyImplCopyWithImpl<$Res>
    extends _$NewCommentBodyCopyWithImpl<$Res, _$NewCommentBodyImpl>
    implements _$$NewCommentBodyImplCopyWith<$Res> {
  __$$NewCommentBodyImplCopyWithImpl(
      _$NewCommentBodyImpl _value, $Res Function(_$NewCommentBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = freezed,
    Object? projectId = freezed,
    Object? content = null,
    Object? attachment = freezed,
  }) {
    return _then(_$NewCommentBodyImpl(
      taskId: freezed == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      attachment: freezed == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as Attachment?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewCommentBodyImpl implements _NewCommentBody {
  const _$NewCommentBodyImpl(
      {@JsonKey(name: 'task_id') this.taskId,
      @JsonKey(name: 'project_id') this.projectId,
      required this.content,
      this.attachment});

  factory _$NewCommentBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewCommentBodyImplFromJson(json);

  @override
  @JsonKey(name: 'task_id')
  final String? taskId;
  @override
  @JsonKey(name: 'project_id')
  final String? projectId;
  @override
  final String content;
  @override
  final Attachment? attachment;

  @override
  String toString() {
    return 'NewCommentBody(taskId: $taskId, projectId: $projectId, content: $content, attachment: $attachment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewCommentBodyImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.attachment, attachment) ||
                other.attachment == attachment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, taskId, projectId, content, attachment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewCommentBodyImplCopyWith<_$NewCommentBodyImpl> get copyWith =>
      __$$NewCommentBodyImplCopyWithImpl<_$NewCommentBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewCommentBodyImplToJson(
      this,
    );
  }
}

abstract class _NewCommentBody implements NewCommentBody {
  const factory _NewCommentBody(
      {@JsonKey(name: 'task_id') final String? taskId,
      @JsonKey(name: 'project_id') final String? projectId,
      required final String content,
      final Attachment? attachment}) = _$NewCommentBodyImpl;

  factory _NewCommentBody.fromJson(Map<String, dynamic> json) =
      _$NewCommentBodyImpl.fromJson;

  @override
  @JsonKey(name: 'task_id')
  String? get taskId;
  @override
  @JsonKey(name: 'project_id')
  String? get projectId;
  @override
  String get content;
  @override
  Attachment? get attachment;
  @override
  @JsonKey(ignore: true)
  _$$NewCommentBodyImplCopyWith<_$NewCommentBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
