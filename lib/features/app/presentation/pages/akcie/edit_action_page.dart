import 'package:action_manager_poc/core/utils/action_utils.dart';
import 'package:action_manager_poc/features/app/domain/entities/action.dart';
import 'package:action_manager_poc/features/app/presentation/bloc/action/action_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EditActionPage extends StatelessWidget {
  final ActionEntity? action;
  const EditActionPage({super.key, this.action});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(context, _formKey),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
        title: Text((action == null) ? 'Vytvor Akciu' : 'Edituj Akciu'));
  }

  _buildBody(BuildContext context, GlobalKey<FormState> formKey) {
    TextEditingController actionNameController = TextEditingController();
    TextEditingController actionDateController = TextEditingController();
    TextEditingController licenceEventController = TextEditingController();
    TextEditingController licenceTypeController = TextEditingController();
    TextEditingController licenceCourseController = TextEditingController();
    if (action != null) {
      actionNameController.text = action!.name;
      actionDateController.text = action!.actionDate;
      licenceEventController.text = action!.licenceEvent;
      licenceTypeController.text = action!.licenceType;
      licenceCourseController.text = action!.licenceCourse;
    }
    return Scrollbar(
        child: SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Form(
          key: formKey,
          child: Column(
            children: [
              _buildFormTextField(actionNameController, "Nazov terminu"),
              // _buildFormTextField(actionDateController, "Datum terminu"),
              _buildFormTextFieldWithDatePicker(
                  context, actionDateController, "Dátum termínu"),
              _buildFormTextField(licenceEventController, "Etapa(s terminom)"),
              _buildFormTextField(licenceCourseController, "Konanie"),
              _buildFormTextField(licenceTypeController, "Oprávnenie"),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      if (action == null) {
                        // Vytvor novu akciu
                        int id = DateTime.now().millisecondsSinceEpoch;
                        ActionEntity actionNew = ActionEntity(
                            id: id,
                            name: actionNameController.text,
                            actionDate: actionDateController.text,
                            licenceEvent: licenceEventController.text,
                            licenceType: licenceTypeController.text,
                            licenceCourse: licenceCourseController.text);
                        _triggerCreateActionEvent(context, actionNew);
                      } else {
                        ActionEntity newAction = action!.copyWith(
                            name: actionNameController.text,
                            actionDate: actionDateController.text,
                            licenceEvent: licenceEventController.text,
                            licenceType: licenceTypeController.text,
                            licenceCourse: licenceCourseController.text);
                        _triggerUpdateActionEvent(context, newAction);
                      }
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('submit'))
            ],
          )),
    ));
  }

  _buildFormTextField(TextEditingController controller, String label,
      {String? value}) {
    if (value != null && value.isNotEmpty) {
      controller.text = value;
    }
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }

  _buildFormTextFieldWithDatePicker(
      BuildContext context, TextEditingController dateController, String label,
      {String? value}) {
    var dateFormatDay = DateFormat('yyyy-MM-dd');
    return TextFormField(
      controller: dateController,
      decoration: InputDecoration(
          labelText: label,
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
                onPressed: () async {
                  DateTime now = (dateController.text.isNotEmpty)
                      ? DateTime.parse(dateController.text)
                      : DateTime.now();
                  DateTime? selected = await showDatePicker(
                      context: context,
                      initialDate: now,
                      firstDate: now.add(-const Duration(days: 30)),
                      lastDate: now.add(const Duration(days: 365)));
                  if (selected != null) {
                    dateController.text = dateFormatDay.format(selected);
                  }
                },
                icon: const Icon(Icons.edit_calendar)),
          )),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter date';
        }
        if (isDate(value) == false) {
          return 'Not valid date object';
        }
        return null;
      },
    );
  }

  void _triggerCreateActionEvent(BuildContext context, ActionEntity actionNew) {
    BlocProvider.of<ActionBloc>(context).add(CreateActionEvent(actionNew));
  }

  void _triggerUpdateActionEvent(BuildContext context, ActionEntity action) {
    BlocProvider.of<ActionBloc>(context).add(UpdateActionEvent(action));
  }
}
