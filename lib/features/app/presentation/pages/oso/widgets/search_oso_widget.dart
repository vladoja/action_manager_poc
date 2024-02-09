import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/oso/oso_filter/oso_filter_bloc.dart';

class SearchOsoWidget extends StatelessWidget {
  final int minSearchLength;
  const SearchOsoWidget({super.key, this.minSearchLength = 3});

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
              if (value == null ||
                  getCleanedText(value).length < minSearchLength) {
                return 'Zadaj minimalne $minSearchLength znaky';
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
                setSearchTerm(context, searchedTerm);
              }
              // else {
              //   // formKey.currentState!.validate();
              //   debugPrint('Search. At least minSearchLength characters');
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

setSearchTerm(BuildContext context, String searchTerm) {
  context.read<OsoFilterBloc>().add(SetOsoSearchTerm(searchTerm: searchTerm));
}
