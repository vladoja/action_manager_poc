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
      title: const Text('Ziadost o skusku: Detaily'),
    );
  }

  _buildBody(BuildContext context) {
    int totalExamEventRequests = (examRequest.examsAssigned != null)
        ? examRequest.examsAssigned!.length
        : 0;
    return Scrollbar(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('DETAILY'),
            const Divider(),
            Text('Počet žiadostí: $totalExamEventRequests'),
            const SizedBox(
              height: 20,
            ),
            _buildPridelTerminWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildPridelTerminWidget() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Pridaj termin'),
    );
  }
}
