import 'package:action_manager_poc/features/app/domain/entities/person.dart';
import 'package:action_manager_poc/features/app/presentation/bloc/personal_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditPersonPage extends StatelessWidget {
  final PersonEntity? person;
  const EditPersonPage({Key? key, this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final lastNameController = TextEditingController();
    final roleController = TextEditingController();

    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(context, _formKey,
          firstName: nameController,
          lastName: lastNameController,
          role: roleController),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Create/Edit Person',
      ),
    );
  }

  _buildBody(BuildContext context, GlobalKey<FormState> formKey,
      {required TextEditingController firstName,
      required TextEditingController lastName,
      required TextEditingController role}) {
    return Scrollbar(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: formKey,
              child: Column(children: [
                _buildFormTextField(firstName, "Meno"),
                _buildFormTextField(lastName, "Priezvisko"),
                _buildFormTextField(role, "Rola"),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        print("Safely validated");
                        int id = DateTime.now().millisecondsSinceEpoch;
                        PersonEntity personNew = PersonEntity(
                            id: id,
                            firstName: firstName.text,
                            lastName: lastName.text,
                            role: role.text);
                        _onCreateButtonTapped(context, personNew);
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Submit')),
              ]),
            )
          ],
        ),
      ),
    );
  }

  _buildFormTextField(TextEditingController controller, String label) {
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

  _buildSubmitButton(BuildContext context, GlobalKey<FormState> formKey) {
    return ElevatedButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            print("Safely validated");
          }
        },
        child: const Text('Submit'));
  }

  void _onCreateButtonTapped(BuildContext context, PersonEntity person) {
    BlocProvider.of<PersonalBloc>(context).add(CreatePersonInPersonal(person));
  }
}
