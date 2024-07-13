// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DurationModelImpl _$$DurationModelImplFromJson(Map<String, dynamic> json) =>
    _$DurationModelImpl(
      amount: (json['amount'] as num?)?.toInt(),
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$$DurationModelImplToJson(_$DurationModelImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'unit': instance.unit,
    };
