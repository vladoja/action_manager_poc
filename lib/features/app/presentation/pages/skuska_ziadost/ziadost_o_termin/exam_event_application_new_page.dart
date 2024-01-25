import 'package:flutter/material.dart';

import '../../../../../../core/widgets/widget_utils.dart';
import '../../../../domain/entities/exam/exam_event_application.dart';

class ExamEventAppicationNewPage extends StatelessWidget {
  const ExamEventAppicationNewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: Placeholder(),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(title: Text('Vytvor ziadost o termin skusky'));
  }

  _buildForm(BuildContext context, GlobalKey<FormState> formKey,
      ExamEventApplication action) {
    TextEditingController actionNameController = TextEditingController();
    TextEditingController actionDateController = TextEditingController();
    TextEditingController licenceEventController = TextEditingController();
    TextEditingController licenceTypeController = TextEditingController();
    TextEditingController licenceCourseController = TextEditingController();
    if (action != null) {
      actionNameController.text = action.actionId.toString();
      actionDateController.text = action.datumOznamenia.toString();
      licenceEventController.text =
          (action.formaOznamenia != null && action.formaOznamenia!.length > 0)
              ? action.formaOznamenia!
              : '';
      licenceTypeController.text = action!.requestExamId.toString();
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
                  buildFormTextField(actionNameController, "Nazov terminu"),
                  // buildFormTextField(actionDateController, "Datum terminu"),
                  buildFormTextFieldWithDatePicker(
                      context, actionDateController, "Dátum termínu"),
                  buildFormTextField(
                      licenceEventController, "Etapa(s terminom)"),
                  buildFormTextField(licenceCourseController, "Konanie"),
                  buildFormTextField(licenceTypeController, "Oprávnenie"),
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
