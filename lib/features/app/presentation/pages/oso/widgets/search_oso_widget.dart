import 'package:flutter/material.dart';

class SearchOsoWidget extends StatelessWidget {
  const SearchOsoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            labelText: 'Vyhladaj ...',
            border: InputBorder.none,
            filled: false,
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (String? newSearchTerm) {
            if (newSearchTerm != null && newSearchTerm.length > 1) {
              debugPrint('Searching for: "${newSearchTerm.toString()}"');
            } else {
              debugPrint('Search. At least 2 characters');
            }
          },
        )
      ],
    );
  }
}
