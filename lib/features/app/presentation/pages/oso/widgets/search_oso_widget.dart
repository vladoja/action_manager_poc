import 'package:flutter/material.dart';

class SearchOsoWidget extends StatelessWidget {
  const SearchOsoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Column(
      children: [
        Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: TextFormField(
            validator: (value) {
              if (value == null || getCleanedText(value).length < 2) {
                return 'Zadaj minimalne 2 znaky';
              }
              if (value != getCleanedText(value)) {
                return 'Retazec obsahuje nepovolene znaky';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Vyhladaj ...',
              border: InputBorder.none,
              filled: false,
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (String? newSearchTerm) {
              if (newSearchTerm != null && newSearchTerm.length > 1) {
                String searchedTerm = getCleanedText(newSearchTerm);
                debugPrint('Searching for: "$searchedTerm"');
              }
              // else {
              //   // formKey.currentState!.validate();
              //   debugPrint('Search. At least 2 characters');
              // }
            },
          ),
        )
      ],
    );
  }
}

String getCleanedText(String text) {
  return text.replaceAll(RegExp(r"\s+"), '');
}
