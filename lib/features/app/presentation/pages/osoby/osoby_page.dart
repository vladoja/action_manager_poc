import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../domain/entities/exam/exam_request.dart';
import '../../../domain/entities/osoba/osoba.dart';
import '../../bloc/exam_request/exam_requests_bloc.dart';
import '../../bloc/osoby/osoby/osoby_bloc.dart';
import 'widgets/osoby_table_widget.dart';

class OsobyPage extends StatelessWidget {
  final int? selectedPersonId;
  const OsobyPage({super.key, this.selectedPersonId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      floatingActionButton: IconButton(
          onPressed: () {
            _onCreateNewOsoba(context);
          },
          icon: const Icon(Icons.add_circle_outline_sharp)),
    );
  }

  void _onCreateNewOsoba(BuildContext context) {
    GoRouter.of(context).go('${AppRoutes.navZoznamyOsoby}/New');
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'AM - Zoznamy / Osoby',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _buildBody(BuildContext context) {
    // watch
    final persons = context.watch<OsobyBloc>().state.osoby;

    int? selectedRowId;
    for (int i = 0; i < persons.length; i++) {
      if (persons[i].id == selectedPersonId) {
        selectedRowId = i;
        break;
      }
    }
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Search osoby'),
          Expanded(
            child: OsobyTableWidget(
              persons: persons,
              clickFunction: (int id) {
                print('Osoby Table. Clicked id: $id');
                OsobaEntity previewedPerson = persons[id];
                if (previewedPerson != null) {
                  ExamRequestEntity? examRequest =
                      _getExamRequestForOsoba(context, previewedPerson.id);
                  print(
                      'Osoba with "${previewedPerson.id}" has examRequest: $examRequest');
                  previewedPerson.copyWith(examRequest: () => examRequest);
                  previewedPerson =
                      previewedPerson.copyWith(examRequest: () => examRequest);
                }
                GoRouter.of(context).go('${AppRoutes.navZoznamyOsoby}/Details',
                    extra: previewedPerson);
              },
              highLighted: selectedRowId,
            ),
          ),
        ],
      ),
    );
  }

  ExamRequestEntity? _getExamRequestForOsoba(BuildContext context, int userId) {
    List<ExamRequestEntity> examRequests =
        context.read<ExamRequestsBloc>().state.examRequests;
    ExamRequestEntity? searchedExamRequest = examRequests
        .cast<ExamRequestEntity?>()
        .firstWhere((element) => element!.userId == userId, orElse: () => null);
    return searchedExamRequest;
  }
}
