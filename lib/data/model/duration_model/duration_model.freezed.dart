// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'duration_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DurationModel _$DurationModelFromJson(Map<String, dynamic> json) {
  return _DurationModel.fromJson(json);
}

/// @nodoc
mixin _$DurationModel {
  int? get amount => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DurationModelCopyWith<DurationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DurationModelCopyWith<$Res> {
  factory $DurationModelCopyWith(
          DurationModel value, $Res Function(DurationModel) then) =
      _$DurationModelCopyWithImpl<$Res, DurationModel>;
  @useResult
  $Res call({int? amount, String? unit});
}

/// @nodoc
class _$DurationModelCopyWithImpl<$Res, $Val extends DurationModel>
    implements $DurationModelCopyWith<$Res> {
  _$DurationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? unit = freezed,
  }) {
    return _then(_value.copyWith(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DurationModelImplCopyWith<$Res>
    implements $DurationModelCopyWith<$Res> {
  factory _$$DurationModelImplCopyWith(
          _$DurationModelImpl value, $Res Function(_$DurationModelImpl) then) =
      __$$DurationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? amount, String? unit});
}

/// @nodoc
class __$$DurationModelImplCopyWithImpl<$Res>
    extends _$DurationModelCopyWithImpl<$Res, _$DurationModelImpl>
    implements _$$DurationModelImplCopyWith<$Res> {
  __$$DurationModelImplCopyWithImpl(
      _$DurationModelImpl _value, $Res Function(_$DurationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? unit = freezed,
  }) {
    return _then(_$DurationModelImpl(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DurationModelImpl implements _DurationModel {
  const _$DurationModelImpl({this.amount, this.unit});

  factory _$DurationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DurationModelImplFromJson(json);

  @override
  final int? amount;
  @override
  final String? unit;

  @override
  String toString() {
    return 'DurationModel(amount: $amount, unit: $unit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DurationModelImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount, unit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DurationModelImplCopyWith<_$DurationModelImpl> get copyWith =>
      __$$DurationModelImplCopyWithImpl<_$DurationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DurationModelImplToJson(
      this,
    );
  }
}

abstract class _DurationModel implements DurationModel {
  const factory _DurationModel({final int? amount, final String? unit}) =
      _$DurationModelImpl;

  factory _DurationModel.fromJson(Map<String, dynamic> json) =
      _$DurationModelImpl.fromJson;

  @override
  int? get amount;
  @override
  String? get unit;
  @override
  @JsonKey(ignore: true)
  _$$DurationModelImplCopyWith<_$DurationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
