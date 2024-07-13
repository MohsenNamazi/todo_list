import 'package:freezed_annotation/freezed_annotation.dart';

part 'duration_model.freezed.dart';
part 'duration_model.g.dart';

@freezed
class DurationModel with _$DurationModel {
  const factory DurationModel({
    int? amount,
    String? unit,
  }) = _DurationModel;

  factory DurationModel.fromJson(Map<String, dynamic> json) =>
      _$DurationModelFromJson(json);
}
