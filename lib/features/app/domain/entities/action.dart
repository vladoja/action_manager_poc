import 'package:equatable/equatable.dart';

class ActionEntity extends Equatable {
  final int id;
  final String name;
  final String actionDate;
  final String licenceEvent;

  const ActionEntity(
      {required this.id,
      required this.name,
      required this.actionDate,
      required this.licenceEvent});

  @override
  List<Object?> get props => [id, name, actionDate, licenceEvent];
}
