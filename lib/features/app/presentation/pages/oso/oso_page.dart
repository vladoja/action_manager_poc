import 'package:flutter/material.dart';

class OSOPage extends StatelessWidget {
  final int? selectedOSOid;
  const OSOPage({super.key, this.selectedOSOid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      floatingActionButton: IconButton(
          onPressed: () {
            // _onCreateNewOsoba(context);
          },
          icon: const Icon(Icons.add_circle_outline_sharp)),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'AM - Zoznamy / OSOS (Odborne Spôsobilé Osoby)',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _buildBody(BuildContext context) {
    // watch
    // final persons = context.watch<OsobyBloc>().state.osoby;

    // int? selectedRowId;
    // for (int i = 0; i < persons.length; i++) {
    //   if (persons[i].id == selectedOSOid) {
    //     selectedRowId = i;
    //     break;
    //   }
    // }
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Search OSO'),
          // Expanded(
          //   child: OsobyTableWidget(
          //     persons: persons,
          //     clickFunction: (int id) {
          //       print('Osoby Table. Clicked id: $id');
          //       OsobaEntity previewedPerson = persons[id];
          //       if (previewedPerson != null) {
          //         ExamRequestEntity? examRequest =
          //             _getExamRequestForOsoba(context, previewedPerson.id);
          //         print(
          //             'Osoba with "${previewedPerson.id}" has examRequest: $examRequest');
          //         previewedPerson.copyWith(examRequest: () => examRequest);
          //         previewedPerson =
          //             previewedPerson.copyWith(examRequest: () => examRequest);
          //       }
          //       GoRouter.of(context).go('${AppRoutes.navZoznamyOsoby}/Details',
          //           extra: previewedPerson);
          //     },
          //     highLighted: selectedRowId,
          //   ),
          // ),
        ],
      ),
    );
  }
}
