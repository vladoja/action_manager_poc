import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/action.dart';
import '../../../domain/entities/person/person.dart';
import '../../bloc/action/action_bloc.dart';
import '../../bloc/personal/personal/personal_bloc.dart';
import 'widgets/action_add_person_table_widget.dart';
import 'widgets/action_show_personal_widget.dart';

class ActionPersonalPage extends StatelessWidget {
  final int actionId;
  const ActionPersonalPage({super.key, required this.actionId});

  @override
  Widget build(BuildContext context) {
    final action = context
        .watch<ActionBloc>()
        .state
        .actions
        .firstWhere((element) => element.id == actionId);
    final persons = context.read<PersonalBloc>().state.persons;
    final personal = getPersonsById(persons, action.personal);
    return Column(
      children: [
        const Text(
          'Personál',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        ActionShowPersonalWidget(
          personal: personal,
          action: action,
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () async {
            List<int> personIdsToAdd = await showDialog(
              context: context,
              builder: (context) {
                List<int> selectedPersonIds = [];
                return AlertDialog(
                  title: const Text('Pridaj personál'),
                  content: ConstrainedBox(
                    constraints: BoxConstraints.expand(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.9),
                    child: ActionAddPersonalTableWidget(
                      persons: persons,
                      selectedPersonIds: selectedPersonIds,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, <int>[]),
                      child: const Text('Zrušiť'),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pop(context, selectedPersonIds),
                      child: const Text('Pridať'),
                    ),
                  ],
                );
              },
            );
            if (personIdsToAdd.isNotEmpty) {
              // print('Pridany personal: $personIdsToAdd');
              _emitAddPersonalToActionEvent(
                  context, personIdsToAdd, persons, action);
            } else {
              // print('Nikto nebol pridany');
            }
          },
          child: const Text('Pridaj personál'),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // <-- Radius
            ),
          ),
        )
      ],
    );
  }

  List<PersonEntity> getPersonsById(
      List<PersonEntity> persons, List<int> personsIds) {
    List<PersonEntity> filtered = persons
        .where((personElement) => personsIds.contains(personElement.id))
        .toList();
    return filtered;
  }

  void _emitAddPersonalToActionEvent(BuildContext context, List<int> personsIds,
      List<PersonEntity> allPersons, ActionEntity action) {
    List<PersonEntity> personsToAdd = getPersonsById(allPersons, personsIds);
    BlocProvider.of<ActionBloc>(context)
        .add(AddPersonalToActionEvent(action: action, persons: personsToAdd));
  }
}
