import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/personal_search/personal_search_bloc.dart';

class SearchPersonWidget extends StatelessWidget {
  const SearchPersonWidget({super.key});

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
            if (newSearchTerm != null) {
              context
                  .read<PersonalSearchBloc>()
                  .add(SetPersonalSearchTerm(newSearchTerm: newSearchTerm));
            }
          },
        ),
      ],
    );
  }
}
