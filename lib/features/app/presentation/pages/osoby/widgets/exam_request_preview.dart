import 'package:flutter/material.dart';

import '../../../../domain/entities/exam/exam_request.dart';
import '../../../../domain/entities/osoba/osoba.dart';

class OsobaExamPreviewWidget extends StatelessWidget {
  final ExamRequestEntity? examRequestEntity;
  final OsobaEntity osoba;
  const OsobaExamPreviewWidget(
      {super.key, this.examRequestEntity, required this.osoba});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Ziadost o skusku',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: (examRequestEntity != null)
                ? [
                    _buildRow('Status prihlasky', 'Aktivna'),
                    _buildRow('Licencia expiruje', '2024/05/30'),
                    _buildRow('Prihlaseny na termin', 'N/A'),
                  ]
                : [
                    _buildRow('Status prihlasky', 'Ziadna'),
                  ],
          ),
        ],
      ),
    );
  }

  ListTile _buildRow(String title, String value) {
    return ListTile(
      leading: Text(title),
      title: Text(value),
      // subtitle: Text(value),
      // trailing: Text(value),
    );
  }
}
