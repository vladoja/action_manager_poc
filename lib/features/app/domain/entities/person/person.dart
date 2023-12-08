import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../../../config/enums/personal_roles_enum.dart';

// part 'person.freezed.dart';
// part 'person.g.dart';

class PersonEntity extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String? title;
  final PersonalRole role;
  final String? status;

  const PersonEntity(
      {required this.id,
      required this.firstName,
      required this.lastName,
      this.title,
      required this.role,
      this.status});

  @override
  List<Object?> get props => [id, firstName, lastName, title, role, status];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'title': title,
      'role': role.toString(),
      'status': status,
    };
  }

  factory PersonEntity.fromMap(Map<String, dynamic> map) {
    return PersonEntity(
        id: map['id'].toInt(),
        firstName: map['firstName'],
        lastName: map['lastName'],
        title: map['title'],
        role: PersonalRole.fromValue(map['role']),
        status: map['status']);
  }

  String toJson() => json.encode(toMap());

  factory PersonEntity.fromJson(String source) =>
      PersonEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PersonEntity(id: $id, firstName: $firstName, lastName: $lastName, title: $title, role: $role, status: $status)';
  }

  PersonEntity copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? title,
    PersonalRole? role,
    String? status,
  }) {
    return PersonEntity(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      title: title ?? this.title,
      role: role ?? this.role,
      status: status ?? this.status,
    );
  }
}
