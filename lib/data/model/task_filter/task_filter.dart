import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_filter.freezed.dart';
part 'task_filter.g.dart';

@freezed
class TaskFilter with _$TaskFilter {
  const factory TaskFilter({
    String? projectId,
    String? sectionId,
    String? label,
    String? filter,
    String? lang,
    List<int>? ids,
  }) = _TaskFilter;

  factory TaskFilter.fromJson(Map<String, dynamic> json) =>
      _$TaskFilterFromJson(json);
}
