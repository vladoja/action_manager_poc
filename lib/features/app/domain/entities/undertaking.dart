import 'package:equatable/equatable.dart';

class UndertakingEntity extends Equatable {
  final int id;
  final String name;
  final String eventDate;
  final String licenceEvent;

  const UndertakingEntity(
      {required this.id,
      required this.name,
      required this.eventDate,
      required this.licenceEvent});

  @override
  List<Object?> get props => [id, name, eventDate, licenceEvent];
}
