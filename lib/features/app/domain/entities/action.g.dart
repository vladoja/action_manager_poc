// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ActionEntity _$$_ActionEntityFromJson(Map<String, dynamic> json) =>
    _$_ActionEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      actionDate: json['actionDate'] as String,
      licenceEvent: json['licenceEvent'] as String,
      licenceType: json['licenceType'] as String,
      licenceCourse: json['licenceCourse'] as String,
    );

Map<String, dynamic> _$$_ActionEntityToJson(_$_ActionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'actionDate': instance.actionDate,
      'licenceEvent': instance.licenceEvent,
      'licenceType': instance.licenceType,
      'licenceCourse': instance.licenceCourse,
    };
