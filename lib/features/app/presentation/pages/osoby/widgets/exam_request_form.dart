import 'package:flutter/material.dart';

import '../../../../../../core/widgets/widget_utils.dart';
import '../../../../domain/entities/exam/exam_request.dart';
import '../../../../domain/entities/osoba/osoba.dart';

class ExamRequestFormWidget extends StatelessWidget {
  final ExamRequestEntity? person;
  final OsobaEntity osobaEntity;
  const ExamRequestFormWidget(
      {super.key, required this.person, required this.osobaEntity});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final typSkoleniaController = TextEditingController();
    final licenceExpirationController = TextEditingController();
    final examRequstStatusController = TextEditingController();
    return _buildBody(
      context,
      formKey,
      typSkolenia: typSkoleniaController,
      licenceExpirationDate: licenceExpirationController,
      examRequestStatus: examRequstStatusController,
    );
  }

  _buildBody(
    BuildContext context,
    GlobalKey<FormState> formKey, {
    required TextEditingController typSkolenia,
    required TextEditingController licenceExpirationDate,
    required TextEditingController examRequestStatus,
  }) {
    return Scrollbar(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: formKey,
              child: Column(children: [
                buildFormTextField(typSkolenia, "Typ skolenia",
                    value: (person != null) ? person!.typSkolenia : null),
                const SizedBox(
                  height: 5,
                ),
                buildFormTextField(licenceExpirationDate, "Expiracia licencie",
                    value: (person != null)
                        ? person!.licenceExpirationDate
                        : null),
                const SizedBox(
                  height: 5,
                ),
                buildFormTextField(examRequestStatus, "Status ziadosti",
                    value: (person != null) ? person!.examRequestStatus : null),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        debugPrint("Safely validated");
                        if (person == null) {
                          int id = DateTime.now().millisecondsSinceEpoch;
                          ExamRequestEntity examRequestNew = ExamRequestEntity(
                              id: id,
                              typSkolenia: typSkolenia.text,
                              licenceExpirationDate: licenceExpirationDate.text,
                              examRequestStatus: examRequestStatus.text,
                              userId: osobaEntity.id);
                          _onCreateButtonTapped(context, examRequestNew);
                        } else {
                          ExamRequestEntity examRequestAfterEdit =
                              person!.copyWith(
                            typSkolenia: typSkolenia.text,
                            licenceExpirationDate: licenceExpirationDate.text,
                            examRequestStatus: examRequestStatus.text,
                          );
                          _onEditButtonTapped(context, examRequestAfterEdit);
                        }
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Ulož')),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  void _onCreateButtonTapped(
      BuildContext context, ExamRequestEntity examRequestNew) {}

  void _onEditButtonTapped(
      BuildContext context, ExamRequestEntity examRequestAfterEdit) {}
}
