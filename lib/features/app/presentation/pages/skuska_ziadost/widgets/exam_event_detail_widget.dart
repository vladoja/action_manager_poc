import 'package:flutter/material.dart';

import '../../../../domain/entities/action.dart';

class ActionEventDetailWidget extends StatelessWidget {
  final ActionEntity actionEntity;
  const ActionEventDetailWidget({super.key, required this.actionEntity});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: ListTile(
            title: const Text('Termin nazov'),
            subtitle: Text(actionEntity.licenceType),
          ),
        ),
        Flexible(
          child: ListTile(
            title: const Text('Datum konania'),
            subtitle: Text(actionEntity.actionDate),
          ),
        ),
      ],
    );
  }
}
