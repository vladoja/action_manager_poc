import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../temp/dummy_ziadosti_o_skusku.dart';
import '../../../domain/entities/exam/exam_request.dart';
import '../../../domain/entities/osoba/osoba.dart';
import '../osoby/osoby/osoby_bloc.dart';

part 'exam_requests_event.dart';
part 'exam_requests_state.dart';

class ExamRequestsBloc extends Bloc<ExamRequestsEvent, ExamRequestsState> {
  final OsobyBloc osobyBloc;
  ExamRequestsBloc({required this.osobyBloc})
      : super(ExamRequestsState.initial()) {
    // : super(const ExamRequestsState(examRequests: exam_requests_data_temp)) {
    on<ExamRequestsChangedEvent>((event, emit) {
      List<ExamRequestEntity> newExamRequestsList = [...event.examRequests];
      emit(ExamRequestsState(examRequests: newExamRequestsList));
    });
    on<CreateExamRequestEvent>(_onCreateExamRequestEvent);
    on<UpdateExamRequestEvent>(_onUpdateExamRequestEvent);

    add(ExamRequestsChangedEvent(
        examRequests:
            _tempInjectOsobyIntoExamRequests(exam_requests_data_temp)));
  }

  List<ExamRequestEntity> _tempInjectOsobyIntoExamRequests(
      List<ExamRequestEntity> examRequests) {
    List<ExamRequestEntity> newExamRequests = [];
    List<OsobaEntity> osoby = osobyBloc.state.osoby;
    for (ExamRequestEntity exam in examRequests) {
      exam = exam.copyWith(
          user: osoby
              .firstWhere((osobaElement) => exam.userId == osobaElement.id));
      newExamRequests.add(exam);
    }

    return newExamRequests;
  }

  ExamRequestEntity _tempInjectOsobaIntoExamRequest(
      ExamRequestEntity examRequest) {
    List<OsobaEntity> osoby = osobyBloc.state.osoby;

    return examRequest.copyWith(
        user: osoby.firstWhere(
            (osobaElement) => examRequest.userId == osobaElement.id));
  }

  FutureOr<void> _onCreateExamRequestEvent(
      CreateExamRequestEvent event, Emitter<ExamRequestsState> emit) {
    List<ExamRequestEntity> examRequests = [...state.examRequests];
    ExamRequestEntity examRequestNew =
        _tempInjectOsobaIntoExamRequest(event.examRequest);
    examRequests.add(examRequestNew);
    emit(ExamRequestsState(examRequests: examRequests));
  }

  FutureOr<void> _onUpdateExamRequestEvent(
      UpdateExamRequestEvent event, Emitter<ExamRequestsState> emit) {
    ExamRequestEntity examRequestToUpdate = event.examRequest;
    List<ExamRequestEntity> examRequests = [
      ...state.examRequests
          .where((element) => element.id != examRequestToUpdate.id)
    ];
    examRequests.add(examRequestToUpdate);
    emit(ExamRequestsState(examRequests: examRequests));
  }
}
