import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'action.g.dart';

@JsonSerializable()
class ActionEntity extends Equatable {
  final int id;
  final String name;
  final String actionDate;
  final String licenceEvent;
  final String licenceType;
  final String licenceCourse;

  const ActionEntity(
      {required this.id,
      required this.name,
      required this.actionDate,
      required this.licenceEvent,
      required this.licenceType,
      required this.licenceCourse});

  @override
  List<Object?> get props =>
      [id, name, actionDate, licenceEvent, licenceCourse, licenceType];

  /// Connect the generated [_$ActionEntityFromJson] function to the `fromJson`
  /// factory.
  factory ActionEntity.fromJson(Map<String, dynamic> json) =>
      _$ActionEntityFromJson(json);

  /// Connect the generated [_$ActionEntityToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ActionEntityToJson(this);
}
