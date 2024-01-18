import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../osoba/osoba.dart';

class ExamRequestEntity extends Equatable {
  final int id;
  final int userId;
  final String typSkolenia;
  final String licenceExpirationDate;
  final String examRequestStatus;
  final List<int>? examsAssigned;
  final OsobaEntity? user;

  const ExamRequestEntity(
      {required this.id,
      required this.userId,
      required this.typSkolenia,
      required this.licenceExpirationDate,
      required this.examRequestStatus,
      this.examsAssigned,
      this.user});

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      typSkolenia,
      licenceExpirationDate,
      examRequestStatus,
      examsAssigned,
      user,
    ];
  }

  @override
  String toString() {
    return 'ExamRequestEntity(id: $id, userId: $userId, typSkolenia: $typSkolenia, licenceExpirationDate: $licenceExpirationDate, examRequestStatus: $examRequestStatus, examsAssigned: $examsAssigned, , user: ${user != null ? user.toString() : ''})';
  }

  ExamRequestEntity copyWith({
    int? id,
    int? userId,
    String? typSkolenia,
    String? licenceExpirationDate,
    String? examRequestStatus,
    ValueGetter<List<int>?>? examsAssigned,
    OsobaEntity? user,
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
      user: user ?? this.user,
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
      'user': (user != null) ? user?.toMap() : null,
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
