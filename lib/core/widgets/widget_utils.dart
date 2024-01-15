import 'package:flutter/material.dart';

buildFormTextField(TextEditingController controller, String label,
    {String? value}) {
  if (value != null && value.isNotEmpty) {
    controller.text = value;
  }
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(labelText: label),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
  );
}
