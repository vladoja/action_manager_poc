part of 'exam_requests_bloc.dart';

abstract class ExamRequestsEvent {
  const ExamRequestsEvent();
}

class ExamRequestsChangedEvent extends ExamRequestsEvent {
  final List<ExamRequestEntity> examRequests;

  ExamRequestsChangedEvent({required this.examRequests});
}

class CreateExamRequestEvent extends ExamRequestsEvent {
  final ExamRequestEntity examRequest;

  CreateExamRequestEvent({required this.examRequest});
}

class UpdateExamRequestEvent extends ExamRequestsEvent {
  final ExamRequestEntity examRequest;

  UpdateExamRequestEvent({required this.examRequest});
}
