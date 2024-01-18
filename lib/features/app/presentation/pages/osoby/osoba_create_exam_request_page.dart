import 'package:flutter/material.dart';

import '../../../domain/entities/osoba/osoba.dart';
import 'widgets/exam_request_form.dart';

class OsobaCreateExamRequestPage extends StatelessWidget {
  final OsobaEntity osoba;
  const OsobaCreateExamRequestPage({super.key, required this.osoba});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(context),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text('Vytvor prihlasku na skusku'),
    );
  }

  _buildBody(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Text('Vytvor prihlasku'),
          const SizedBox(
            height: 30,
          ),
          ExamRequestFormWidget(
            osobaEntity: osoba,
            person: null,
          ),
        ]),
      ),
    );
  }
}
