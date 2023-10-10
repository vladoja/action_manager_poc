import 'package:flutter/material.dart';

class ConfirmationWidget extends StatelessWidget {
  const ConfirmationWidget(
      {super.key,
      required this.questionTitle,
      required this.questionDescription});
  final String questionTitle;
  final String questionDescription;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(questionTitle),
      content: Text(
        questionDescription,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.error,
          ),
          child: const Text('Yes'),
        ),
      ],
    );
  }
}
