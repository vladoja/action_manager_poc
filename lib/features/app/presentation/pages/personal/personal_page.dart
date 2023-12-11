import 'widgets/personal_table_widget.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../domain/entities/person/person.dart';
import '../../bloc/personal_bloc.dart';
import '../../widgets/confirmation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      floatingActionButton: IconButton(
          onPressed: () {
            _onCreateNewPerson(context);
          },
          icon: const Icon(Icons.add_circle)),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'AM - Personal',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return BlocBuilder<PersonalBloc, PersonalState>(
      builder: (_, state) {
        if (state is PersonalLoading) {
          return Center(
            child: IconButton(
              onPressed: () {
                _onReloadButtonTapped(context);
              },
              icon: const Icon(Icons.refresh),
              tooltip: "Tap me",
            ),
          );
        }
        if (state is PersonalDone) {
          var persons = state.persons;
          if (persons.isEmpty) {
            return const Center(
              child: Text('Empty'),
            );
          } else {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: PersonalTableWidget(
                      persons: persons,
                      clickFunction: (int id) {
                        final previewedPerson = persons[id];
                        GoRouter.of(context).go(
                            '${AppRoutes.navZoznamyPersonal}/Details',
                            extra: previewedPerson);
                      },
                    ),
                  )
                ],
              ),
            );
          }
        }

        debugPrint("No bloc event catched");
        return const FittedBox(
          child: Icon(Icons.error),
        );
      },
    );
  }

  _createPersonTile(BuildContext context, PersonEntity person) {
    return ListTile(
        leading: Column(
          children: [
            Text(
              "${person.firstName!} ${person.lastName}",
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              person.role.toString(),
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            )
          ],
        ),
        trailing: FittedBox(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () async {
                  debugPrint('Delete clicked');
                  final confirmed = await showDialog(
                    context: context,
                    builder: (context) => const ConfirmationWidget(
                        questionTitle: "Naozaj zmazat ?",
                        questionDescription:
                            "Naozaj zmazat osobu z personalu?"),
                  );
                  if (confirmed == true) {
                    _onRemovePersonTapped(context, person);
                  }
                },
                icon: const Icon(
                  Icons.delete,
                  size: 30,
                  color: Colors.red,
                ),
              ),
              IconButton(
                onPressed: () {
                  _onEditPersonTapped(context, person);
                },
                icon: const Icon(
                  Icons.edit,
                  size: 30,
                  color: Colors.green,
                ),
              )
            ],
          ),
        ));
  }

  void _onRemovePersonTapped(BuildContext context, PersonEntity person) {
    BlocProvider.of<PersonalBloc>(context)
        .add(RemovePersonFromPersonal(person));
  }

  void _onReloadButtonTapped(BuildContext context) {
    BlocProvider.of<PersonalBloc>(context).add(const GetPersonal());
  }

  void _onEditPersonTapped(BuildContext context, PersonEntity person) {
    // Navigator.pushNamed(context, '/Personal/Details', arguments: person);
    GoRouter.of(context)
        .go('${AppRoutes.navZoznamyPersonal}/Details', extra: person);
  }

  void _onCreateNewPerson(BuildContext context) {
    GoRouter.of(context).go('${AppRoutes.navZoznamyPersonal}/New');
  }
}
