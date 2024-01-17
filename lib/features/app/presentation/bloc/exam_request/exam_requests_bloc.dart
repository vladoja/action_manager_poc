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

    add(ExamRequestsChangedEvent(
        examRequests:
            tempInjectOsobyIntoExamRequests(exam_requests_data_temp)));
  }

  List<ExamRequestEntity> tempInjectOsobyIntoExamRequests(
      List<ExamRequestEntity> examRequests) {
    List<ExamRequestEntity> newExamRequests = [];
    List<OsobaEntity> osoby = osobyBloc.state.osoby;
    for (ExamRequestEntity exam in examRequests) {
      exam = exam.copyWith(
          user: osoby.firstWhere((element) => exam.id == element.id));
      newExamRequests.add(exam);
    }

    return newExamRequests;
  }
}
