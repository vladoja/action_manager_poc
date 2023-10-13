import 'package:action_manager_poc/features/app/domain/entities/action.dart';
import 'package:flutter/material.dart';

class ActionPreviewWidget extends StatelessWidget {
  final ActionEntity action;
  const ActionPreviewWidget({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      children: [
        const Text(
          "Detaily",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(action.name),
        Text(action.actionDate),
      ],
    ));
  }
}
