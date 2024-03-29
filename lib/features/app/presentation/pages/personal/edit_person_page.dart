import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/enums/personal_roles_enum.dart';
import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/widgets/delete_alert.dart';
import '../../../domain/entities/person/person.dart';
import '../../bloc/personal/personal/personal_bloc.dart';

final scaffoldKey = GlobalKey<ScaffoldState>();

class EditPersonPage extends StatelessWidget {
  final PersonEntity? person;
  const EditPersonPage({Key? key, this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final lastNameController = TextEditingController();
    final roleController = TextEditingController();
    final titleController = TextEditingController();

    return Scaffold(
      appBar: _buildAppbar(context),
      key: scaffoldKey,
      body: _buildBody(
        context,
        _formKey,
        firstName: nameController,
        lastName: lastNameController,
        role: roleController,
        title: titleController,
      ),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: Text((person == null) ? 'Create Person' : 'Edit Person'),
      actions: (person != null)
          ? [
              IconButton(
                  onPressed: () async {
                    bool result = await showDialog(
                      context: context,
                      builder: (ctx) => createDeleteDialog(ctx),
                    );
                    if (result) {
                      _onDeleteButtonTapped(
                          scaffoldKey.currentContext!, person!);
                      GoRouter.of(scaffoldKey.currentContext!)
                          .go(AppRoutes.navZoznamyPersonal);
                    }
                  },
                  icon: const Icon(Icons.delete,
                      color: Color.fromARGB(255, 212, 34, 22)))
            ]
          : [],
    );
  }

  _buildBody(BuildContext context, GlobalKey<FormState> formKey,
      {required TextEditingController firstName,
      required TextEditingController lastName,
      required TextEditingController role,
      required TextEditingController title}) {
    PersonalRole? role =
        (person != null) ? person!.role : PersonalRole.prisediaci;
    return Scrollbar(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: formKey,
              child: Column(children: [
                _buildFormTextField(firstName, "Meno",
                    value: (person != null) ? person!.firstName : null),
                const SizedBox(
                  height: 5,
                ),
                _buildFormTextField(lastName, "Priezvisko",
                    value: (person != null) ? person!.lastName : null),
                const SizedBox(
                  height: 5,
                ),
                _buildFormTextField(title, "Titul",
                    value: (person != null) ? person!.title : null),
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField<PersonalRole>(
                    value: role,
                    onChanged: (PersonalRole? newValue) {
                      role = newValue!;
                    },
                    items: PersonalRole.values.map((PersonalRole role) {
                      return DropdownMenuItem(
                          value: role, child: Text(role.toString()));
                    }).toList()),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        debugPrint("Safely validated");
                        if (person == null) {
                          int id = DateTime.now().millisecondsSinceEpoch;
                          PersonEntity personNew = PersonEntity(
                              id: id,
                              firstName: firstName.text,
                              lastName: lastName.text,
                              title: title.text,
                              role: role!);
                          _onCreateButtonTapped(context, personNew);
                        } else {
                          PersonEntity personAfterEdit = PersonEntity(
                              id: person!.id,
                              firstName: firstName.text,
                              lastName: lastName.text,
                              title: title.text,
                              role: role!);
                          _onEditButtonTapped(context, personAfterEdit);
                        }
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

  _buildSubmitButton(BuildContext context, GlobalKey<FormState> formKey) {
    return ElevatedButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            debugPrint("Safely validated");
          }
        },
        child: const Text('Submit'));
  }

  void _onCreateButtonTapped(BuildContext context, PersonEntity person) {
    BlocProvider.of<PersonalBloc>(context).add(CreatePersonInPersonal(person));
  }

  void _onEditButtonTapped(BuildContext context, PersonEntity person) {
    BlocProvider.of<PersonalBloc>(context).add(UpdatePersonInPersonal(person));
  }

  void _onDeleteButtonTapped(BuildContext context, PersonEntity person) {
    BlocProvider.of<PersonalBloc>(context)
        .add(RemovePersonFromPersonal(person));
  }
}
