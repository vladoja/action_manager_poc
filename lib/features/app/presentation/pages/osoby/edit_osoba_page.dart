import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/delete_alert.dart';
import '../../../../../core/widgets/widget_utils.dart';
import '../../../domain/entities/osoba/osoba.dart';
import '../../bloc/osoby/osoby/osoby_bloc.dart';

class EditOsobaPage extends StatelessWidget {
  final OsobaEntity? person;
  // final scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: 'edit-osoba');
  const EditOsobaPage({super.key, this.person});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final lastNameController = TextEditingController();
    final employerController = TextEditingController();
    final titleController = TextEditingController();
    final cityController = TextEditingController();
    final phoneController = TextEditingController();
    return Scaffold(
      appBar: _buildAppbar(context),
      // key: scaffoldKey,
      body: _buildBody(
        context,
        formKey,
        firstName: nameController,
        lastName: lastNameController,
        employer: employerController,
        title: titleController,
        city: cityController,
        phone: phoneController,
      ),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: Text((person == null) ? 'Vytvor osobu' : 'Edituj osobu'),
      actions: (person != null)
          ? [
              IconButton(
                  onPressed: () async {
                    bool result = await showDialog(
                      context: context,
                      builder: (ctx) => createDeleteDialog(ctx),
                    );
                    if (result) {
                      _onDeleteButtonTapped(context, person!);
                      // GoRouter.of(context).go(AppRoutes.navZoznamyOsoby);
                      if (GoRouter.of(context).canPop()) {
                        GoRouter.of(context).pop();
                      }
                    }
                  },
                  icon: const Icon(Icons.delete,
                      color: Color.fromARGB(255, 212, 34, 22)))
            ]
          : [],
    );
  }

  _buildBody(
    BuildContext context,
    GlobalKey<FormState> formKey, {
    required TextEditingController firstName,
    required TextEditingController lastName,
    required TextEditingController title,
    required TextEditingController employer,
    required TextEditingController city,
    required TextEditingController phone,
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
                buildFormTextField(firstName, "Meno",
                    value: (person != null) ? person!.firstName : null),
                const SizedBox(
                  height: 5,
                ),
                buildFormTextField(lastName, "Priezvisko",
                    value: (person != null) ? person!.lastName : null),
                const SizedBox(
                  height: 5,
                ),
                buildFormTextField(title, "Titul",
                    value: (person != null) ? person!.title : null),
                const SizedBox(
                  height: 10,
                ),
                buildFormTextField(employer, "Zamestnávateľ",
                    value: (person != null) ? person!.employer : null),
                const SizedBox(
                  height: 10,
                ),
                buildFormTextField(city, "Mesto",
                    value: (person != null) ? person!.city : null),
                const SizedBox(
                  height: 10,
                ),
                buildFormTextField(phone, "Telefon",
                    value: (person != null) ? person!.phone : null),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        debugPrint("Safely validated");
                        if (person == null) {
                          int id = DateTime.now().millisecondsSinceEpoch;
                          OsobaEntity personNew = OsobaEntity(
                              id: id,
                              firstName: firstName.text,
                              lastName: lastName.text,
                              title: title.text,
                              employer: employer.text,
                              city: city.text,
                              phone: phone.text);
                          _onCreateButtonTapped(context, personNew);
                        } else {
                          OsobaEntity personAfterEdit = OsobaEntity(
                              id: person!.id,
                              firstName: firstName.text,
                              lastName: lastName.text,
                              title: title.text,
                              employer: employer.text,
                              city: city.text,
                              phone: phone.text);
                          _onEditButtonTapped(context, personAfterEdit);
                        }
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Ulož')),
              ]),
            )
          ],
        ),
      ),
    );
  }

  void _onCreateButtonTapped(BuildContext context, OsobaEntity person) {
    BlocProvider.of<OsobyBloc>(context).add(CreateOsobaInOsoby(person));
  }

  void _onEditButtonTapped(BuildContext context, OsobaEntity person) {
    BlocProvider.of<OsobyBloc>(context).add(UpdateOsobaInOsoby(person));
  }

  void _onDeleteButtonTapped(BuildContext context, OsobaEntity person) {
    BlocProvider.of<OsobyBloc>(context).add(RemoveOsobaInOsoby(person));
  }
}
