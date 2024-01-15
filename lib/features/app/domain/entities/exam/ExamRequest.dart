import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class ExamRequestEntity extends Equatable {
  final int id;
  final int userId;
  final String typSkolenia;
  final String licenceExpirationDate;
  final String examReqeustStatus;
  final List<int>? examsAssigned;

  const ExamRequestEntity(
      {required this.id,
      required this.userId,
      required this.typSkolenia,
      required this.licenceExpirationDate,
      required this.examReqeustStatus,
      required this.examsAssigned});

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      typSkolenia,
      licenceExpirationDate,
      examReqeustStatus,
      examsAssigned,
    ];
  }

  @override
  String toString() {
    return 'ExamRequestEntity(id: $id, userId: $userId, typSkolenia: $typSkolenia, licenceExpirationDate: $licenceExpirationDate, examReqeustStatus: $examReqeustStatus, examsAssigned: $examsAssigned)';
  }

  ExamRequestEntity copyWith({
    int? id,
    int? userId,
    String? typSkolenia,
    String? licenceExpirationDate,
    String? examReqeustStatus,
    ValueGetter<List<int>?>? examsAssigned,
  }) {
    return ExamRequestEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      typSkolenia: typSkolenia ?? this.typSkolenia,
      licenceExpirationDate:
          licenceExpirationDate ?? this.licenceExpirationDate,
      examReqeustStatus: examReqeustStatus ?? this.examReqeustStatus,
      examsAssigned:
          examsAssigned != null ? examsAssigned() : this.examsAssigned,
    );
  }
}
