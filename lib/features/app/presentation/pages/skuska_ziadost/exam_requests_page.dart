import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/exam_request/exam_requests_bloc.dart';
import 'widgets/exam_requests_table_widget.dart';

class ExamRequestsPage extends StatelessWidget {
  final int? selectedPersonId;
  const ExamRequestsPage({super.key, this.selectedPersonId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'AM - Zoznamy / Žiadosti o skúšku',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _buildBody(BuildContext context) {
    // watch
    final examRequests = context.watch<ExamRequestsBloc>().state.examRequests;

    int? selectedRowId;
    for (int i = 0; i < examRequests.length; i++) {
      if (examRequests[i].id == selectedPersonId) {
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
            child: ExamRequestsTableWidget(
              examRequests: examRequests,
              clickFunction: (int id) {
                print('Osoby Table. Clicked id: $id');
              },
              highLighted: selectedRowId,
            ),
          ),
        ],
      ),
    );
  }
}
