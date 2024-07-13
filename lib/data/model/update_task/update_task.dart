import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_task.freezed.dart';
part 'update_task.g.dart';

@freezed
class UpdateTaskBody with _$UpdateTaskBody {
  const factory UpdateTaskBody({
    String? content,
    String? description,
    List<String>? labels,
    int? priority,
    String? dueString,
    String? dueDate,
    String? dueDatetime,
    String? dueLang,
    String? assigneeId,
    int? duration,
    String? durationUnit,
  }) = _UpdateTaskBody;

  factory UpdateTaskBody.fromJson(Map<String, dynamic> json) =>
      _$UpdateTaskBodyFromJson(json);
}
