import 'dart:developer';

import 'package:action_manager_poc/features/app/domain/entities/action.dart';
import 'package:action_manager_poc/features/app/presentation/bloc/action/action_bloc.dart';
import 'package:action_manager_poc/features/app/presentation/widgets/confirmation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionPreviewWidget extends StatelessWidget {
  final ActionEntity action;
  final Function deleteFunction;
  const ActionPreviewWidget(
      {super.key, required this.action, required this.deleteFunction});

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
            onPressed: () {
              _deleteAction(context);
            },
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

  _deleteAction(BuildContext context) async {
    final confirmed = await _showDeleteDialog(context);
    if (confirmed == true) {
      deleteFunction(context, action);
    }
  }

  Future<bool> _showDeleteDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => const ConfirmationWidget(
          questionTitle: "Zmazat akciu?",
          questionDescription: "Naozaj zmazat akciu?"),
    );
  }
}
