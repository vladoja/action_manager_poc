import 'dart:developer';

import '../../../../domain/entities/person/person.dart';
import '../../personal/widgets/personal_table_widget.dart';
import 'package:flutter/material.dart';

class ActionAddPersonalTableWidget extends StatelessWidget {
  final List<PersonEntity> persons;
  final List<int> selectedPersonIds;

  const ActionAddPersonalTableWidget(
      {super.key, required this.persons, required this.selectedPersonIds});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Vybranych: ${selectedPersonIds.length}'),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: PersonalTableWidget(
            persons: persons,
            clickFunction: selectedPersons,
          ),
        ),
      ],
    );
  }

  selectedPersons(List<bool> selected) {
    selectedPersonIds.clear();
    selected.asMap().forEach((key, value) {
      if (value == true) {
        selectedPersonIds.add(key);
      }
    })
        // selectedPersonIds.addAll((selected.map((e) => null) );
        ;
    log('Selected persons: ${selectedPersonIds}');
  }
}
