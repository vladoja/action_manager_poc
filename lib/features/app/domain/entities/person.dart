import 'package:equatable/equatable.dart';

class PersonEntity extends Equatable {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? title;
  final String? role;
  final String? status;

  const PersonEntity(
      {this.id,
      this.firstName,
      this.lastName,
      this.title,
      this.role,
      this.status});

  @override
  List<Object?> get props => [id, firstName, lastName, title, role, status];
}
