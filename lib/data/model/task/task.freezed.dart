// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'project_id')
  String? get projectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'section_id')
  String? get sectionId => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_completed')
  bool? get isCompleted => throw _privateConstructorUsedError;
  List<String>? get labels => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_id')
  String? get parentId => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;
  int? get priority => throw _privateConstructorUsedError;
  Due? get due => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment_count')
  int? get commentCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'creator_id')
  String? get creatorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'assignee_id')
  String? get assigneeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'assigner_id')
  String? get assignerId => throw _privateConstructorUsedError;
  DurationModel? get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'project_id') String? projectId,
      @JsonKey(name: 'section_id') String? sectionId,
      String? content,
      String? description,
      @JsonKey(name: 'is_completed') bool? isCompleted,
      List<String>? labels,
      @JsonKey(name: 'parent_id') String? parentId,
      int? order,
      int? priority,
      Due? due,
      String? url,
      @JsonKey(name: 'comment_count') int? commentCount,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'creator_id') String? creatorId,
      @JsonKey(name: 'assignee_id') String? assigneeId,
      @JsonKey(name: 'assigner_id') String? assignerId,
      DurationModel? duration});

  $DueCopyWith<$Res>? get due;
  $DurationModelCopyWith<$Res>? get duration;
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = freezed,
    Object? sectionId = freezed,
    Object? content = freezed,
    Object? description = freezed,
    Object? isCompleted = freezed,
    Object? labels = freezed,
    Object? parentId = freezed,
    Object? order = freezed,
    Object? priority = freezed,
    Object? due = freezed,
    Object? url = freezed,
    Object? commentCount = freezed,
    Object? createdAt = freezed,
    Object? creatorId = freezed,
    Object? assigneeId = freezed,
    Object? assignerId = freezed,
    Object? duration = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      sectionId: freezed == sectionId
          ? _value.sectionId
          : sectionId // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      labels: freezed == labels
          ? _value.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
      due: freezed == due
          ? _value.due
          : due // ignore: cast_nullable_to_non_nullable
              as Due?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      commentCount: freezed == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorId: freezed == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String?,
      assigneeId: freezed == assigneeId
          ? _value.assigneeId
          : assigneeId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignerId: freezed == assignerId
          ? _value.assignerId
          : assignerId // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as DurationModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DueCopyWith<$Res>? get due {
    if (_value.due == null) {
      return null;
    }

    return $DueCopyWith<$Res>(_value.due!, (value) {
      return _then(_value.copyWith(due: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DurationModelCopyWith<$Res>? get duration {
    if (_value.duration == null) {
      return null;
    }

    return $DurationModelCopyWith<$Res>(_value.duration!, (value) {
      return _then(_value.copyWith(duration: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'project_id') String? projectId,
      @JsonKey(name: 'section_id') String? sectionId,
      String? content,
      String? description,
      @JsonKey(name: 'is_completed') bool? isCompleted,
      List<String>? labels,
      @JsonKey(name: 'parent_id') String? parentId,
      int? order,
      int? priority,
      Due? due,
      String? url,
      @JsonKey(name: 'comment_count') int? commentCount,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'creator_id') String? creatorId,
      @JsonKey(name: 'assignee_id') String? assigneeId,
      @JsonKey(name: 'assigner_id') String? assignerId,
      DurationModel? duration});

  @override
  $DueCopyWith<$Res>? get due;
  @override
  $DurationModelCopyWith<$Res>? get duration;
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = freezed,
    Object? sectionId = freezed,
    Object? content = freezed,
    Object? description = freezed,
    Object? isCompleted = freezed,
    Object? labels = freezed,
    Object? parentId = freezed,
    Object? order = freezed,
    Object? priority = freezed,
    Object? due = freezed,
    Object? url = freezed,
    Object? commentCount = freezed,
    Object? createdAt = freezed,
    Object? creatorId = freezed,
    Object? assigneeId = freezed,
    Object? assignerId = freezed,
    Object? duration = freezed,
  }) {
    return _then(_$TaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      sectionId: freezed == sectionId
          ? _value.sectionId
          : sectionId // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      labels: freezed == labels
          ? _value._labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
      due: freezed == due
          ? _value.due
          : due // ignore: cast_nullable_to_non_nullable
              as Due?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      commentCount: freezed == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorId: freezed == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String?,
      assigneeId: freezed == assigneeId
          ? _value.assigneeId
          : assigneeId // ignore: cast_nullable_to_non_nullable
              as String?,
      assignerId: freezed == assignerId
          ? _value.assignerId
          : assignerId // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as DurationModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskImpl implements _Task {
  const _$TaskImpl(
      {required this.id,
      @JsonKey(name: 'project_id') this.projectId,
      @JsonKey(name: 'section_id') this.sectionId,
      this.content,
      this.description,
      @JsonKey(name: 'is_completed') this.isCompleted,
      final List<String>? labels,
      @JsonKey(name: 'parent_id') this.parentId,
      this.order,
      this.priority,
      this.due,
      this.url,
      @JsonKey(name: 'comment_count') this.commentCount,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'creator_id') this.creatorId,
      @JsonKey(name: 'assignee_id') this.assigneeId,
      @JsonKey(name: 'assigner_id') this.assignerId,
      this.duration})
      : _labels = labels;

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'project_id')
  final String? projectId;
  @override
  @JsonKey(name: 'section_id')
  final String? sectionId;
  @override
  final String? content;
  @override
  final String? description;
  @override
  @JsonKey(name: 'is_completed')
  final bool? isCompleted;
  final List<String>? _labels;
  @override
  List<String>? get labels {
    final value = _labels;
    if (value == null) return null;
    if (_labels is EqualUnmodifiableListView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'parent_id')
  final String? parentId;
  @override
  final int? order;
  @override
  final int? priority;
  @override
  final Due? due;
  @override
  final String? url;
  @override
  @JsonKey(name: 'comment_count')
  final int? commentCount;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'creator_id')
  final String? creatorId;
  @override
  @JsonKey(name: 'assignee_id')
  final String? assigneeId;
  @override
  @JsonKey(name: 'assigner_id')
  final String? assignerId;
  @override
  final DurationModel? duration;

  @override
  String toString() {
    return 'Task(id: $id, projectId: $projectId, sectionId: $sectionId, content: $content, description: $description, isCompleted: $isCompleted, labels: $labels, parentId: $parentId, order: $order, priority: $priority, due: $due, url: $url, commentCount: $commentCount, createdAt: $createdAt, creatorId: $creatorId, assigneeId: $assigneeId, assignerId: $assignerId, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.sectionId, sectionId) ||
                other.sectionId == sectionId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            const DeepCollectionEquality().equals(other._labels, _labels) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.due, due) || other.due == due) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.assigneeId, assigneeId) ||
                other.assigneeId == assigneeId) &&
            (identical(other.assignerId, assignerId) ||
                other.assignerId == assignerId) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      projectId,
      sectionId,
      content,
      description,
      isCompleted,
      const DeepCollectionEquality().hash(_labels),
      parentId,
      order,
      priority,
      due,
      url,
      commentCount,
      createdAt,
      creatorId,
      assigneeId,
      assignerId,
      duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(
      this,
    );
  }
}

abstract class _Task implements Task {
  const factory _Task(
      {required final String id,
      @JsonKey(name: 'project_id') final String? projectId,
      @JsonKey(name: 'section_id') final String? sectionId,
      final String? content,
      final String? description,
      @JsonKey(name: 'is_completed') final bool? isCompleted,
      final List<String>? labels,
      @JsonKey(name: 'parent_id') final String? parentId,
      final int? order,
      final int? priority,
      final Due? due,
      final String? url,
      @JsonKey(name: 'comment_count') final int? commentCount,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'creator_id') final String? creatorId,
      @JsonKey(name: 'assignee_id') final String? assigneeId,
      @JsonKey(name: 'assigner_id') final String? assignerId,
      final DurationModel? duration}) = _$TaskImpl;

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'project_id')
  String? get projectId;
  @override
  @JsonKey(name: 'section_id')
  String? get sectionId;
  @override
  String? get content;
  @override
  String? get description;
  @override
  @JsonKey(name: 'is_completed')
  bool? get isCompleted;
  @override
  List<String>? get labels;
  @override
  @JsonKey(name: 'parent_id')
  String? get parentId;
  @override
  int? get order;
  @override
  int? get priority;
  @override
  Due? get due;
  @override
  String? get url;
  @override
  @JsonKey(name: 'comment_count')
  int? get commentCount;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'creator_id')
  String? get creatorId;
  @override
  @JsonKey(name: 'assignee_id')
  String? get assigneeId;
  @override
  @JsonKey(name: 'assigner_id')
  String? get assignerId;
  @override
  DurationModel? get duration;
  @override
  @JsonKey(ignore: true)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
