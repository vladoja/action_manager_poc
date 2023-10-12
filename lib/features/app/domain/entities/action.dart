import 'package:equatable/equatable.dart';

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
}
