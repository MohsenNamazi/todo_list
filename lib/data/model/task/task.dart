import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/data/model/due/due.dart';
import 'package:todo_list/data/model/duration_model/duration_model.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
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
    DurationModel? duration,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
