// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActionEntityImpl _$$ActionEntityImplFromJson(Map<String, dynamic> json) =>
    _$ActionEntityImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      actionDate: json['actionDate'] as String,
      licenceEvent: json['licenceEvent'] as String,
      licenceType: json['licenceType'] as String,
      licenceCourse: json['licenceCourse'] as String,
      personal:
          (json['personal'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$ActionEntityImplToJson(_$ActionEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'actionDate': instance.actionDate,
      'licenceEvent': instance.licenceEvent,
      'licenceType': instance.licenceType,
      'licenceCourse': instance.licenceCourse,
      'personal': instance.personal,
    };
