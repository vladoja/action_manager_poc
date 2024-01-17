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
    examsAssigned: [],
  ),
];
