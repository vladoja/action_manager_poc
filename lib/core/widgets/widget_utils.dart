import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/action_utils.dart';

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

buildFormTextFieldWithDatePicker(
    BuildContext context, TextEditingController dateController, String label,
    {String? value}) {
  var dateFormatDay = DateFormat('yyyy-MM-dd');
  return TextFormField(
    controller: dateController,
    decoration: InputDecoration(
        labelText: label,
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: IconButton(
              onPressed: () async {
                DateTime now = (dateController.text.isNotEmpty)
                    ? DateTime.parse(dateController.text)
                    : DateTime.now();
                DateTime? selected = await showDatePicker(
                    context: context,
                    initialDate: now,
                    firstDate: now.add(-const Duration(days: 30)),
                    lastDate: now.add(const Duration(days: 365)));
                if (selected != null) {
                  dateController.text = dateFormatDay.format(selected);
                }
              },
              icon: const Icon(Icons.edit_calendar)),
        )),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter date';
      }
      if (isDate(value) == false) {
        return 'Not valid date object';
      }
      return null;
    },
  );
}
