import 'package:flutter/material.dart';

import '../../../../domain/entities/exam/exam_request.dart';

class OsobaExamPreviewWidget extends StatelessWidget {
  final ExamRequestEntity? examRequestEntity;
  const OsobaExamPreviewWidget({super.key, this.examRequestEntity});

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
                    _buildRow('Status prihlasky', 'Nedostupna'),
                  ],
          ),
          // Text('Status: Aktivna'),
          // Text('Licencia: 2024/05/30'),
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
