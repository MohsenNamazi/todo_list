import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_task.freezed.dart';
part 'new_task.g.dart';

@freezed
class NewTaskBody with _$NewTaskBody {
  const factory NewTaskBody({
    required String content,
    String? description,
    String? projectId,
    String? sectionId,
    String? parentId,
    int? order,
    List<String>? labels,
    int? priority,
    String? dueString,
    String? dueDate,
    String? dueDatetime,
    String? dueLang,
    String? assigneeId,
    int? duration,
    String? durationUnit,
  }) = _NewTaskBody;

  factory NewTaskBody.fromJson(Map<String, dynamic> json) =>
      _$NewTaskBodyFromJson(json);
}
