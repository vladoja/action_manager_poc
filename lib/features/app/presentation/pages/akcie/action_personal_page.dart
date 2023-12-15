import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/person/person.dart';
import '../../bloc/action/action_bloc.dart';
import '../../bloc/personal/personal/personal_bloc.dart';
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
    final pesons = context.read<PersonalBloc>().state.persons;
    final personal = getPersonsById(pesons, action.personal);
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
          onPressed: () {},
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
