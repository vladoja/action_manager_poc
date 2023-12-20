import 'package:flutter/material.dart';

import '../../../../domain/entities/person/person.dart';
import '../../personal/widgets/personal_table_widget.dart';

class ActionAddPersonalTableWidget extends StatefulWidget {
  final List<PersonEntity> persons;
  final List<int> selectedPersonIds;

  const ActionAddPersonalTableWidget(
      {super.key, required this.persons, required this.selectedPersonIds});

  @override
  State<ActionAddPersonalTableWidget> createState() =>
      _ActionAddPersonalTableWidgetState();
}

class _ActionAddPersonalTableWidgetState
    extends State<ActionAddPersonalTableWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Vybraných: ${widget.selectedPersonIds.length}'),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: PersonalTableWidget(
            persons: widget.persons,
            clickFunction: selectedPersons,
            showCheckboxColumnInTable: true,
          ),
        ),
      ],
    );
  }

  selectedPersons(List<bool> selected) {
    setState(() {
      widget.selectedPersonIds.clear();
      selected.asMap().forEach((key, value) {
        if (value == true) {
          widget.selectedPersonIds.add(widget.persons[key].id);
        }
      });
    });
  }
}
