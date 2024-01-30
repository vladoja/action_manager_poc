import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../../../../config/enums/exam_event_application_status_enum.dart';

class ExamEventApplication extends Equatable {
  final int actionId;
  final int requestExamId;
  final String? formaOznamenia;
  final String? datumOznamenia;
  final ExamEventAppliationStatus status;

  const ExamEventApplication(
      {required this.actionId,
      required this.requestExamId,
      required this.formaOznamenia,
      required this.datumOznamenia,
      this.status = ExamEventAppliationStatus.aktivny});

  @override
  List<Object?> get props =>
      [actionId, requestExamId, formaOznamenia, datumOznamenia, status];

  @override
  String toString() {
    return 'ExamEventApplication(actionId: $actionId, requestExamId: $requestExamId, formaOznamenia: $formaOznamenia, datumOznamenia: $datumOznamenia, status: $status)';
  }

  ExamEventApplication copyWith({
    int? actionId,
    int? requestExamId,
    ValueGetter<String?>? formaOznamenia,
    ValueGetter<String?>? datumOznamenia,
    ExamEventAppliationStatus? status,
  }) {
    return ExamEventApplication(
        actionId: actionId ?? this.actionId,
        requestExamId: requestExamId ?? this.requestExamId,
        formaOznamenia:
            formaOznamenia != null ? formaOznamenia() : this.formaOznamenia,
        datumOznamenia:
            datumOznamenia != null ? datumOznamenia() : this.datumOznamenia,
        status: status ?? this.status);
  }
}
