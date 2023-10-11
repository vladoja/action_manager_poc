import 'package:floor/floor.dart';

enum PersonalRole {
  skusajuci("SKUSAJUCI"),
  prisediaci("PRISEDIACI"),
  predseda("PREDSEDA"),
  ministersky("MINISTERSKY");

  const PersonalRole(this.role);
  final String role;

  @override
  toString() {
    return role;
  }

  static PersonalRole fromValue(jsonValue) =>
      PersonalRole.values.singleWhere((i) => jsonValue == i.role);
}

class PersonalRoleConverter extends TypeConverter<PersonalRole, String> {
  @override
  PersonalRole decode(String databaseValue) {
    return PersonalRole.fromValue(databaseValue);
  }

  @override
  String encode(PersonalRole value) {
    return value.toString();
  }
}
