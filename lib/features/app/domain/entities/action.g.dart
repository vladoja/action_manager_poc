// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionEntity _$ActionEntityFromJson(Map<String, dynamic> json) => ActionEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      actionDate: json['actionDate'] as String,
      licenceEvent: json['licenceEvent'] as String,
      licenceType: json['licenceType'] as String,
      licenceCourse: json['licenceCourse'] as String,
    );

Map<String, dynamic> _$ActionEntityToJson(ActionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'actionDate': instance.actionDate,
      'licenceEvent': instance.licenceEvent,
      'licenceType': instance.licenceType,
      'licenceCourse': instance.licenceCourse,
    };
