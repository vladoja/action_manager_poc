import 'package:flutter/material.dart';

import '../../../domain/entities/exam/exam_request.dart';

class ExamRequestDetails extends StatelessWidget {
  final ExamRequestEntity examRequest;
  const ExamRequestDetails({super.key, required this.examRequest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(context),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: Text('Ziadost o skusku: Detialy'),
    );
  }

  _buildBody(BuildContext context) {
    return const Scrollbar(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text('DETAILY')],
        ),
      ),
    );
  }
}
