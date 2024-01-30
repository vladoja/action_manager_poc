import 'package:flutter/material.dart';

import '../../../../../../core/widgets/widget_utils.dart';
import '../../../../domain/entities/exam/exam_event_application.dart';
import '../../../../domain/entities/exam/exam_request.dart';

class ExamEventAppicationNewPage extends StatelessWidget {
  final ExamRequestEntity examRequest;
  const ExamEventAppicationNewPage({super.key, required this.examRequest});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildForm(context, formKey),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(title: Text('Vytvor ziadost o termin skusky'));
  }

  _buildForm(BuildContext context, GlobalKey<FormState> formKey,
      {ExamEventApplication? action}) {
    TextEditingController actionNameController = TextEditingController();
    TextEditingController datumOznameniaController = TextEditingController();
    TextEditingController licenceEventController = TextEditingController();
    TextEditingController licenceCourseController = TextEditingController();
    if (action != null) {
      actionNameController.text = action.actionId.toString();
      datumOznameniaController.text = action.datumOznamenia.toString();
      licenceEventController.text =
          (action.formaOznamenia != null && action.formaOznamenia!.length > 0)
              ? action.formaOznamenia!
              : '';
    }
    return Column(
      children: [
        Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  buildFormTextField(
                      actionNameController, "ID ziadosti o skúšku",
                      disableEditing: true, value: examRequest.id.toString()),
                  buildFormTextFieldWithDatePicker(
                      context, datumOznameniaController, "Dátum oznámenia"),
                  buildFormTextField(licenceEventController, "Forma oznamenia"),
                  buildFormTextField(licenceCourseController, "Status"),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        if (action == null) {
                        } else {}
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Uložiť'),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
