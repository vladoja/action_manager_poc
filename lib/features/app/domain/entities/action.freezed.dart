// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ActionEntity _$ActionEntityFromJson(Map<String, dynamic> json) {
  return _ActionEntity.fromJson(json);
}

/// @nodoc
mixin _$ActionEntity {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get actionDate => throw _privateConstructorUsedError;
  String get licenceEvent => throw _privateConstructorUsedError;
  String get licenceType => throw _privateConstructorUsedError;
  String get licenceCourse => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActionEntityCopyWith<ActionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionEntityCopyWith<$Res> {
  factory $ActionEntityCopyWith(
          ActionEntity value, $Res Function(ActionEntity) then) =
      _$ActionEntityCopyWithImpl<$Res, ActionEntity>;
  @useResult
  $Res call(
      {int id,
      String name,
      String actionDate,
      String licenceEvent,
      String licenceType,
      String licenceCourse});
}

/// @nodoc
class _$ActionEntityCopyWithImpl<$Res, $Val extends ActionEntity>
    implements $ActionEntityCopyWith<$Res> {
  _$ActionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? actionDate = null,
    Object? licenceEvent = null,
    Object? licenceType = null,
    Object? licenceCourse = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      actionDate: null == actionDate
          ? _value.actionDate
          : actionDate // ignore: cast_nullable_to_non_nullable
              as String,
      licenceEvent: null == licenceEvent
          ? _value.licenceEvent
          : licenceEvent // ignore: cast_nullable_to_non_nullable
              as String,
      licenceType: null == licenceType
          ? _value.licenceType
          : licenceType // ignore: cast_nullable_to_non_nullable
              as String,
      licenceCourse: null == licenceCourse
          ? _value.licenceCourse
          : licenceCourse // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActionEntityImplCopyWith<$Res>
    implements $ActionEntityCopyWith<$Res> {
  factory _$$ActionEntityImplCopyWith(
          _$ActionEntityImpl value, $Res Function(_$ActionEntityImpl) then) =
      __$$ActionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String actionDate,
      String licenceEvent,
      String licenceType,
      String licenceCourse});
}

/// @nodoc
class __$$ActionEntityImplCopyWithImpl<$Res>
    extends _$ActionEntityCopyWithImpl<$Res, _$ActionEntityImpl>
    implements _$$ActionEntityImplCopyWith<$Res> {
  __$$ActionEntityImplCopyWithImpl(
      _$ActionEntityImpl _value, $Res Function(_$ActionEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? actionDate = null,
    Object? licenceEvent = null,
    Object? licenceType = null,
    Object? licenceCourse = null,
  }) {
    return _then(_$ActionEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      actionDate: null == actionDate
          ? _value.actionDate
          : actionDate // ignore: cast_nullable_to_non_nullable
              as String,
      licenceEvent: null == licenceEvent
          ? _value.licenceEvent
          : licenceEvent // ignore: cast_nullable_to_non_nullable
              as String,
      licenceType: null == licenceType
          ? _value.licenceType
          : licenceType // ignore: cast_nullable_to_non_nullable
              as String,
      licenceCourse: null == licenceCourse
          ? _value.licenceCourse
          : licenceCourse // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActionEntityImpl implements _ActionEntity {
  const _$ActionEntityImpl(
      {required this.id,
      required this.name,
      required this.actionDate,
      required this.licenceEvent,
      required this.licenceType,
      required this.licenceCourse});

  factory _$ActionEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActionEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String actionDate;
  @override
  final String licenceEvent;
  @override
  final String licenceType;
  @override
  final String licenceCourse;

  @override
  String toString() {
    return 'ActionEntity(id: $id, name: $name, actionDate: $actionDate, licenceEvent: $licenceEvent, licenceType: $licenceType, licenceCourse: $licenceCourse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.actionDate, actionDate) ||
                other.actionDate == actionDate) &&
            (identical(other.licenceEvent, licenceEvent) ||
                other.licenceEvent == licenceEvent) &&
            (identical(other.licenceType, licenceType) ||
                other.licenceType == licenceType) &&
            (identical(other.licenceCourse, licenceCourse) ||
                other.licenceCourse == licenceCourse));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, actionDate,
      licenceEvent, licenceType, licenceCourse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionEntityImplCopyWith<_$ActionEntityImpl> get copyWith =>
      __$$ActionEntityImplCopyWithImpl<_$ActionEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActionEntityImplToJson(
      this,
    );
  }
}

abstract class _ActionEntity implements ActionEntity {
  const factory _ActionEntity(
      {required final int id,
      required final String name,
      required final String actionDate,
      required final String licenceEvent,
      required final String licenceType,
      required final String licenceCourse}) = _$ActionEntityImpl;

  factory _ActionEntity.fromJson(Map<String, dynamic> json) =
      _$ActionEntityImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get actionDate;
  @override
  String get licenceEvent;
  @override
  String get licenceType;
  @override
  String get licenceCourse;
  @override
  @JsonKey(ignore: true)
  _$$ActionEntityImplCopyWith<_$ActionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
