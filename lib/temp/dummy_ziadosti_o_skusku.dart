import '../features/app/domain/entities/exam/exam_event_application.dart';
import '../features/app/domain/entities/exam/exam_request.dart';

const exam_requests_data_temp = <ExamRequestEntity>[
  ExamRequestEntity(
    id: 1,
    licenceExpirationDate: '2024/04/30',
    examRequestStatus: 'VYTVORENA',
    typSkolenia: 'Emisne kontroly',
    userId: 1,
    examsAssigned: [],
  ),
  ExamRequestEntity(
    id: 2,
    licenceExpirationDate: '2024/04/30',
    examRequestStatus: 'VYTVORENA',
    typSkolenia: 'Emisne kontroly',
    userId: 3,
    examsAssigned: [1],
  ),
];

const exam_event_applications_temp = <ExamEventApplication>[
  ExamEventApplication(
      id: 1,
      actionId: 1,
      requestExamId: 2,
      formaOznamenia: 'email',
      datumOznamenia: '2024/01/31'),
];
