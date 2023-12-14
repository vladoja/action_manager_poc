import 'package:flutter/material.dart';

import '../../../domain/entities/action.dart';
import 'widgets/action_show_personal_widget.dart';

class ActionPersonalPage extends StatelessWidget {
  final ActionEntity action;
  const ActionPersonalPage({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    final personal = action.personal;
    return Column(
      children: [
        const Text(
          'Personal',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        ActionShowPersonalWidget(personal: personal),
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
}
