// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return _Project.fromJson(json);
}

/// @nodoc
mixin _$Project {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment_count')
  int get commentCount => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_id')
  String? get parentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_shared')
  bool get isShared => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_favorite')
  bool get isFavorite => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_inbox_project')
  bool get isInboxProject => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_team_inbox')
  bool get isTeamInbox => throw _privateConstructorUsedError;
  @JsonKey(name: 'view_style')
  String get viewStyle => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res, Project>;
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(name: 'comment_count') int commentCount,
      int order,
      String color,
      @JsonKey(name: 'parent_id') String? parentId,
      @JsonKey(name: 'is_shared') bool isShared,
      @JsonKey(name: 'is_favorite') bool isFavorite,
      @JsonKey(name: 'is_inbox_project') bool isInboxProject,
      @JsonKey(name: 'is_team_inbox') bool isTeamInbox,
      @JsonKey(name: 'view_style') String viewStyle,
      String url});
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res, $Val extends Project>
    implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? commentCount = null,
    Object? order = null,
    Object? color = null,
    Object? parentId = freezed,
    Object? isShared = null,
    Object? isFavorite = null,
    Object? isInboxProject = null,
    Object? isTeamInbox = null,
    Object? viewStyle = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      isShared: null == isShared
          ? _value.isShared
          : isShared // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      isInboxProject: null == isInboxProject
          ? _value.isInboxProject
          : isInboxProject // ignore: cast_nullable_to_non_nullable
              as bool,
      isTeamInbox: null == isTeamInbox
          ? _value.isTeamInbox
          : isTeamInbox // ignore: cast_nullable_to_non_nullable
              as bool,
      viewStyle: null == viewStyle
          ? _value.viewStyle
          : viewStyle // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectImplCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$$ProjectImplCopyWith(
          _$ProjectImpl value, $Res Function(_$ProjectImpl) then) =
      __$$ProjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(name: 'comment_count') int commentCount,
      int order,
      String color,
      @JsonKey(name: 'parent_id') String? parentId,
      @JsonKey(name: 'is_shared') bool isShared,
      @JsonKey(name: 'is_favorite') bool isFavorite,
      @JsonKey(name: 'is_inbox_project') bool isInboxProject,
      @JsonKey(name: 'is_team_inbox') bool isTeamInbox,
      @JsonKey(name: 'view_style') String viewStyle,
      String url});
}

/// @nodoc
class __$$ProjectImplCopyWithImpl<$Res>
    extends _$ProjectCopyWithImpl<$Res, _$ProjectImpl>
    implements _$$ProjectImplCopyWith<$Res> {
  __$$ProjectImplCopyWithImpl(
      _$ProjectImpl _value, $Res Function(_$ProjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? commentCount = null,
    Object? order = null,
    Object? color = null,
    Object? parentId = freezed,
    Object? isShared = null,
    Object? isFavorite = null,
    Object? isInboxProject = null,
    Object? isTeamInbox = null,
    Object? viewStyle = null,
    Object? url = null,
  }) {
    return _then(_$ProjectImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      isShared: null == isShared
          ? _value.isShared
          : isShared // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      isInboxProject: null == isInboxProject
          ? _value.isInboxProject
          : isInboxProject // ignore: cast_nullable_to_non_nullable
              as bool,
      isTeamInbox: null == isTeamInbox
          ? _value.isTeamInbox
          : isTeamInbox // ignore: cast_nullable_to_non_nullable
              as bool,
      viewStyle: null == viewStyle
          ? _value.viewStyle
          : viewStyle // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectImpl implements _Project {
  const _$ProjectImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'comment_count') required this.commentCount,
      required this.order,
      required this.color,
      @JsonKey(name: 'parent_id') this.parentId,
      @JsonKey(name: 'is_shared') required this.isShared,
      @JsonKey(name: 'is_favorite') required this.isFavorite,
      @JsonKey(name: 'is_inbox_project') required this.isInboxProject,
      @JsonKey(name: 'is_team_inbox') required this.isTeamInbox,
      @JsonKey(name: 'view_style') required this.viewStyle,
      required this.url});

  factory _$ProjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(name: 'comment_count')
  final int commentCount;
  @override
  final int order;
  @override
  final String color;
  @override
  @JsonKey(name: 'parent_id')
  final String? parentId;
  @override
  @JsonKey(name: 'is_shared')
  final bool isShared;
  @override
  @JsonKey(name: 'is_favorite')
  final bool isFavorite;
  @override
  @JsonKey(name: 'is_inbox_project')
  final bool isInboxProject;
  @override
  @JsonKey(name: 'is_team_inbox')
  final bool isTeamInbox;
  @override
  @JsonKey(name: 'view_style')
  final String viewStyle;
  @override
  final String url;

  @override
  String toString() {
    return 'Project(id: $id, name: $name, commentCount: $commentCount, order: $order, color: $color, parentId: $parentId, isShared: $isShared, isFavorite: $isFavorite, isInboxProject: $isInboxProject, isTeamInbox: $isTeamInbox, viewStyle: $viewStyle, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.isShared, isShared) ||
                other.isShared == isShared) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.isInboxProject, isInboxProject) ||
                other.isInboxProject == isInboxProject) &&
            (identical(other.isTeamInbox, isTeamInbox) ||
                other.isTeamInbox == isTeamInbox) &&
            (identical(other.viewStyle, viewStyle) ||
                other.viewStyle == viewStyle) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      commentCount,
      order,
      color,
      parentId,
      isShared,
      isFavorite,
      isInboxProject,
      isTeamInbox,
      viewStyle,
      url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      __$$ProjectImplCopyWithImpl<_$ProjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectImplToJson(
      this,
    );
  }
}

abstract class _Project implements Project {
  const factory _Project(
      {required final String id,
      required final String name,
      @JsonKey(name: 'comment_count') required final int commentCount,
      required final int order,
      required final String color,
      @JsonKey(name: 'parent_id') final String? parentId,
      @JsonKey(name: 'is_shared') required final bool isShared,
      @JsonKey(name: 'is_favorite') required final bool isFavorite,
      @JsonKey(name: 'is_inbox_project') required final bool isInboxProject,
      @JsonKey(name: 'is_team_inbox') required final bool isTeamInbox,
      @JsonKey(name: 'view_style') required final String viewStyle,
      required final String url}) = _$ProjectImpl;

  factory _Project.fromJson(Map<String, dynamic> json) = _$ProjectImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'comment_count')
  int get commentCount;
  @override
  int get order;
  @override
  String get color;
  @override
  @JsonKey(name: 'parent_id')
  String? get parentId;
  @override
  @JsonKey(name: 'is_shared')
  bool get isShared;
  @override
  @JsonKey(name: 'is_favorite')
  bool get isFavorite;
  @override
  @JsonKey(name: 'is_inbox_project')
  bool get isInboxProject;
  @override
  @JsonKey(name: 'is_team_inbox')
  bool get isTeamInbox;
  @override
  @JsonKey(name: 'view_style')
  String get viewStyle;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
