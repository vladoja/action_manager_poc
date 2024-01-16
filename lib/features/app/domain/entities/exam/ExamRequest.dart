import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class ExamRequestEntity extends Equatable {
  final int id;
  final int userId;
  final String typSkolenia;
  final String licenceExpirationDate;
  final String examRequestStatus;
  final List<int>? examsAssigned;

  const ExamRequestEntity(
      {required this.id,
      required this.userId,
      required this.typSkolenia,
      required this.licenceExpirationDate,
      required this.examRequestStatus,
      required this.examsAssigned});

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      typSkolenia,
      licenceExpirationDate,
      examRequestStatus,
      examsAssigned,
    ];
  }

  @override
  String toString() {
    return 'ExamRequestEntity(id: $id, userId: $userId, typSkolenia: $typSkolenia, licenceExpirationDate: $licenceExpirationDate, examRequestStatus: $examRequestStatus, examsAssigned: $examsAssigned)';
  }

  ExamRequestEntity copyWith({
    int? id,
    int? userId,
    String? typSkolenia,
    String? licenceExpirationDate,
    String? examRequestStatus,
    ValueGetter<List<int>?>? examsAssigned,
  }) {
    return ExamRequestEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      typSkolenia: typSkolenia ?? this.typSkolenia,
      licenceExpirationDate:
          licenceExpirationDate ?? this.licenceExpirationDate,
      examRequestStatus: examRequestStatus ?? this.examRequestStatus,
      examsAssigned:
          examsAssigned != null ? examsAssigned() : this.examsAssigned,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'typSkolenia': typSkolenia,
      'licenceExpirationDate': licenceExpirationDate,
      'examRequestStatus': examRequestStatus,
      'examsAssigned': examsAssigned,
    };
  }

  factory ExamRequestEntity.fromMap(Map<String, dynamic> map) {
    return ExamRequestEntity(
      id: map['id']?.toInt() ?? 0,
      userId: map['userId']?.toInt() ?? 0,
      typSkolenia: map['typSkolenia'] ?? '',
      licenceExpirationDate: map['licenceExpirationDate'] ?? '',
      examRequestStatus: map['examRequestStatse'] ?? '',
      examsAssigned: List<int>.from(map['examsAssigned']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ExamRequestEntity.fromJson(String source) =>
      ExamRequestEntity.fromMap(json.decode(source));
}
