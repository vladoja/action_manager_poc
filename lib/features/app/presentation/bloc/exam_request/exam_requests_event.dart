part of 'exam_requests_bloc.dart';

abstract class ExamRequestsEvent {
  const ExamRequestsEvent();
}

class ExamRequestsChangedEvent extends ExamRequestsEvent {
  final List<ExamRequestEntity> examRequests;

  ExamRequestsChangedEvent({required this.examRequests});
}
