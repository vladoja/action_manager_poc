import 'package:freezed_annotation/freezed_annotation.dart';

import 'person/person.dart';

part 'action.freezed.dart';
part 'action.g.dart';

@freezed
class ActionEntity with _$ActionEntity {
  const factory ActionEntity(
      {required int id,
      required String name,
      required String actionDate,
      required String licenceEvent,
      required String licenceType,
      required String licenceCourse,
      required List<PersonEntity> personal}) = _ActionEntity;

  factory ActionEntity.fromJson(Map<String, Object?> json) =>
      _$ActionEntityFromJson(json);
}
