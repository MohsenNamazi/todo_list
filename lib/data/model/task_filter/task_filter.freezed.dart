// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskFilter _$TaskFilterFromJson(Map<String, dynamic> json) {
  return _TaskFilter.fromJson(json);
}

/// @nodoc
mixin _$TaskFilter {
  String? get projectId => throw _privateConstructorUsedError;
  String? get sectionId => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get filter => throw _privateConstructorUsedError;
  String? get lang => throw _privateConstructorUsedError;
  int? get priority => throw _privateConstructorUsedError;
  List<int>? get ids => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskFilterCopyWith<TaskFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskFilterCopyWith<$Res> {
  factory $TaskFilterCopyWith(
          TaskFilter value, $Res Function(TaskFilter) then) =
      _$TaskFilterCopyWithImpl<$Res, TaskFilter>;
  @useResult
  $Res call(
      {String? projectId,
      String? sectionId,
      String? label,
      String? filter,
      String? lang,
      int? priority,
      List<int>? ids});
}

/// @nodoc
class _$TaskFilterCopyWithImpl<$Res, $Val extends TaskFilter>
    implements $TaskFilterCopyWith<$Res> {
  _$TaskFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = freezed,
    Object? sectionId = freezed,
    Object? label = freezed,
    Object? filter = freezed,
    Object? lang = freezed,
    Object? priority = freezed,
    Object? ids = freezed,
  }) {
    return _then(_value.copyWith(
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      sectionId: freezed == sectionId
          ? _value.sectionId
          : sectionId // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String?,
      lang: freezed == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
      ids: freezed == ids
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskFilterImplCopyWith<$Res>
    implements $TaskFilterCopyWith<$Res> {
  factory _$$TaskFilterImplCopyWith(
          _$TaskFilterImpl value, $Res Function(_$TaskFilterImpl) then) =
      __$$TaskFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? projectId,
      String? sectionId,
      String? label,
      String? filter,
      String? lang,
      int? priority,
      List<int>? ids});
}

/// @nodoc
class __$$TaskFilterImplCopyWithImpl<$Res>
    extends _$TaskFilterCopyWithImpl<$Res, _$TaskFilterImpl>
    implements _$$TaskFilterImplCopyWith<$Res> {
  __$$TaskFilterImplCopyWithImpl(
      _$TaskFilterImpl _value, $Res Function(_$TaskFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = freezed,
    Object? sectionId = freezed,
    Object? label = freezed,
    Object? filter = freezed,
    Object? lang = freezed,
    Object? priority = freezed,
    Object? ids = freezed,
  }) {
    return _then(_$TaskFilterImpl(
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      sectionId: freezed == sectionId
          ? _value.sectionId
          : sectionId // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String?,
      lang: freezed == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
      ids: freezed == ids
          ? _value._ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskFilterImpl implements _TaskFilter {
  const _$TaskFilterImpl(
      {this.projectId,
      this.sectionId,
      this.label,
      this.filter,
      this.lang,
      this.priority,
      final List<int>? ids})
      : _ids = ids;

  factory _$TaskFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskFilterImplFromJson(json);

  @override
  final String? projectId;
  @override
  final String? sectionId;
  @override
  final String? label;
  @override
  final String? filter;
  @override
  final String? lang;
  @override
  final int? priority;
  final List<int>? _ids;
  @override
  List<int>? get ids {
    final value = _ids;
    if (value == null) return null;
    if (_ids is EqualUnmodifiableListView) return _ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TaskFilter(projectId: $projectId, sectionId: $sectionId, label: $label, filter: $filter, lang: $lang, priority: $priority, ids: $ids)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskFilterImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.sectionId, sectionId) ||
                other.sectionId == sectionId) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            const DeepCollectionEquality().equals(other._ids, _ids));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, projectId, sectionId, label,
      filter, lang, priority, const DeepCollectionEquality().hash(_ids));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskFilterImplCopyWith<_$TaskFilterImpl> get copyWith =>
      __$$TaskFilterImplCopyWithImpl<_$TaskFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskFilterImplToJson(
      this,
    );
  }
}

abstract class _TaskFilter implements TaskFilter {
  const factory _TaskFilter(
      {final String? projectId,
      final String? sectionId,
      final String? label,
      final String? filter,
      final String? lang,
      final int? priority,
      final List<int>? ids}) = _$TaskFilterImpl;

  factory _TaskFilter.fromJson(Map<String, dynamic> json) =
      _$TaskFilterImpl.fromJson;

  @override
  String? get projectId;
  @override
  String? get sectionId;
  @override
  String? get label;
  @override
  String? get filter;
  @override
  String? get lang;
  @override
  int? get priority;
  @override
  List<int>? get ids;
  @override
  @JsonKey(ignore: true)
  _$$TaskFilterImplCopyWith<_$TaskFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
