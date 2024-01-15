part of 'exam_requests_bloc.dart';

class ExamRequestsState extends Equatable {
  final List<ExamRequestEntity> examRequests;

  const ExamRequestsState({required this.examRequests});

  factory ExamRequestsState.initial() {
    return const ExamRequestsState(examRequests: <ExamRequestEntity>[]);
  }

  @override
  List<Object> get props => [examRequests];
}
