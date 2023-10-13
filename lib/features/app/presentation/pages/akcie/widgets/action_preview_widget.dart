import 'package:action_manager_poc/features/app/domain/entities/action.dart';
import 'package:flutter/material.dart';

class ActionPreviewWidget extends StatelessWidget {
  final ActionEntity action;
  const ActionPreviewWidget({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Text('XXXX'),
            ),
            Expanded(
              flex: 3,
              child: _createTitleAndDate(action.name, action.actionDate),
            ),
            const Icon(
              Icons.more_vert,
              size: 16.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _createTitleAndDate(String title, String date) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            date,
            style: const TextStyle(fontSize: 10.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            'views',
            style: const TextStyle(fontSize: 10.0),
          ),
        ],
      ),
    );
  }
}
