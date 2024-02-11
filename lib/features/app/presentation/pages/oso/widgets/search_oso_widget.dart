import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../config/constants.dart';
import '../../../bloc/oso/oso_filter/oso_filter_bloc.dart';

class SearchOsoWidget extends StatelessWidget {
  final int minSearchLength;
  const SearchOsoWidget(
      {super.key, this.minSearchLength = kOsoSearchMinCharacters});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController searchController = TextEditingController();
    return Column(
      children: [
        Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: TextFormField(
            controller: searchController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return null;
              }

              if (getCleanedText(value).length < minSearchLength) {
                return 'Zadaj minimalne $minSearchLength znaky';
              }
              if (value != getCleanedText(value)) {
                return 'Retazec obsahuje nepovolene znaky';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Vyhladaj ...',
              border: InputBorder.none,
              filled: false,
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                onPressed: () {
                  searchController.clear();
                  setSearchTerm(context, '');
                },
                icon: const Icon(Icons.clear_rounded),
              ),
            ),
            onChanged: (String? newSearchTerm) {
              if (newSearchTerm != null &&
                  newSearchTerm.length >= kOsoSearchMinCharacters) {
                String searchedTerm = getCleanedText(newSearchTerm);
                debugPrint('Searching for: "$searchedTerm"');
                setSearchTerm(context, searchedTerm);
              } else if (newSearchTerm != null && newSearchTerm.isEmpty) {
                setSearchTerm(context, '');
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
