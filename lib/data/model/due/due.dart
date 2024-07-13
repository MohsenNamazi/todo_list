import 'package:freezed_annotation/freezed_annotation.dart';

part 'due.freezed.dart';
part 'due.g.dart';

@freezed
class Due with _$Due {
  const factory Due({
    String? date,
    @JsonKey(name: 'is_recurring') bool? isRecurring,
    String? datetime,
    String? string,
    String? timezone,
  }) = _Due;

  factory Due.fromJson(Map<String, dynamic> json) => _$DueFromJson(json);
}
