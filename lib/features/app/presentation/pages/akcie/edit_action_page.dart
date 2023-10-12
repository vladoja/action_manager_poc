import 'package:action_manager_poc/features/app/domain/entities/action.dart';
import 'package:flutter/material.dart';

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
    return Scrollbar(
        child: SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Form(
          child: Column(
        children: [
          _buildFormTextField(actionNameController, "Nazov terminu"),
          _buildFormTextField(actionDateController, "Datum terminu"),
          _buildFormTextField(licenceEventController, "Etapa(s terminom)"),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(onPressed: () {}, child: const Text('submit'))
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
}
