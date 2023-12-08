import '../../../../config/enums/personal_roles_enum.dart';
import '../../domain/entities/person/person.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'person', primaryKeys: ['id'])
class PersonModel extends PersonEntity {
  const PersonModel({
    int? id,
    String? firstName,
    String? lastName,
    String? title,
    required PersonalRole role,
    String? status,
  }) : super(
            id: id,
            firstName: firstName,
            lastName: lastName,
            role: role,
            status: status);

  factory PersonModel.fromJson(Map<String, dynamic> map) {
    return PersonModel(
        firstName: map['firstName'] ?? "",
        lastName: map['lastName'] ?? "",
        title: map['title'] ?? "",
        role: map['role'],
        status: map['status'] ?? "");
  }

  factory PersonModel.fromEntity(PersonEntity entity) {
    return PersonModel(
        id: entity.id,
        firstName: entity.firstName,
        lastName: entity.lastName,
        role: entity.role,
        status: entity.status);
  }
}
