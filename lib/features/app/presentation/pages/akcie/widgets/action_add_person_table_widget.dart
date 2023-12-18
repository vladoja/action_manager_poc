import '../../../../domain/entities/person/person.dart';
import '../../personal/widgets/personal_table_widget.dart';
import 'package:flutter/material.dart';

class ActionAddPersonalTableWidget extends StatelessWidget {
  final List<PersonEntity> persons;
  const ActionAddPersonalTableWidget({super.key, required this.persons});

  @override
  Widget build(BuildContext context) {
    return PersonalTableWidget(
      persons: persons,
      clickFunction: (int id) {
        final previewedPerson = persons[id];
      },
    );
  }
}
