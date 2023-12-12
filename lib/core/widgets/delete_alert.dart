import 'package:flutter/material.dart';

AlertDialog createDeleteDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Are you sure ?'),
    content: const Text('Do you really want to delete ?'),
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
}
