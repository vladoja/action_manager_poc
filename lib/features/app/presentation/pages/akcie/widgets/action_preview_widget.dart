import 'dart:developer';

import 'package:action_manager_poc/features/app/domain/entities/action.dart';
import 'package:flutter/material.dart';

class ActionPreviewWidget extends StatelessWidget {
  final ActionEntity action;
  const ActionPreviewWidget({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: _createTitleAndDate(action.name, action.actionDate),
            ),
            Expanded(
              flex: 3,
              child: _createEventInfo(
                  action.licenceType, action.licenceType, action.licenceCourse),
            ),
            Expanded(flex: 0, child: _createIconPanel(context)),
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
        mainAxisSize: MainAxisSize.min,
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
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0))
        ],
      ),
    );
  }

  Widget _createEventInfo(
      String licenceEvent, String licenceType, String licenceCourse) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            licenceCourse,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            licenceType,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            licenceEvent,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _createIconPanel(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(
            onPressed: () {
              _goToActionDetails(context);
            },
            icon: const Icon(Icons.edit),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
        ],
      ),
    );
  }

  _goToActionDetails(BuildContext context) {
    log("Go to action details");
    Navigator.of(context).pushNamed('/Akcie/Details', arguments: action);
  }
}
