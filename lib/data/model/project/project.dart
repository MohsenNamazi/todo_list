import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/data/model/color/todoist_color.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  const factory Project({
    required String id,
    required String name,
    @JsonKey(name: 'comment_count') required int commentCount,
    required int order,
    required String color,
    @JsonKey(name: 'parent_id') String? parentId,
    @JsonKey(name: 'is_shared') required bool isShared,
    @JsonKey(name: 'is_favorite') required bool isFavorite,
    @JsonKey(name: 'is_inbox_project') required bool isInboxProject,
    @JsonKey(name: 'is_team_inbox') required bool isTeamInbox,
    @JsonKey(name: 'view_style') required String viewStyle,
    required String url,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}

extension ProjectExtension on Project {
  int get colorCode => TodoistColor.fromName(color).colorCode;
}
