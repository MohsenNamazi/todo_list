import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/data/model/color/todoist_color.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  const factory Project({
    required String id,
    String? name,
    @JsonKey(name: 'comment_count') int? commentCount,
    int? order,
    String? color,
    @JsonKey(name: 'parent_id') String? parentId,
    @JsonKey(name: 'is_shared') bool? isShared,
    @JsonKey(name: 'is_favorite') bool? isFavorite,
    @JsonKey(name: 'is_inbox_project') bool? isInboxProject,
    @JsonKey(name: 'is_team_inbox') bool? isTeamInbox,
    @JsonKey(name: 'view_style') String? viewStyle,
    String? url,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}

extension ProjectExtension on Project {
  int get colorCode => TodoistColor.fromName(color ?? '').colorCode;
}
