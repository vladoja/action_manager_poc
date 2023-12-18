import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          'Personal',
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
            return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Pridaj personal'),
                    content: ConstrainedBox(
                        constraints: BoxConstraints.expand(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.9),
                        child: ActionAddPersonalTableWidget(persons: persons)),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text('NO'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text('YES'),
                      ),
                    ],
                  );
                });
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
}
