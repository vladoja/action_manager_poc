import 'package:action_manager_poc/config/enums/personal_roles_enum.dart';
import 'package:equatable/equatable.dart';

class PersonEntity extends Equatable {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? title;
  final PersonalRole role;
  final String? status;

  const PersonEntity(
      {this.id,
      this.firstName,
      this.lastName,
      this.title,
      required this.role,
      this.status});

  @override
  List<Object?> get props => [id, firstName, lastName, title, role, status];
}
