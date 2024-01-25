import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/action.dart';
import '../../../domain/entities/exam/exam_request.dart';
import '../../bloc/action/action_bloc.dart';
import '../../bloc/exam_request/exam_requests_bloc.dart';
import '../akcie/widgets/action_table_widget.dart';
import 'widgets/exam_event_detail_widget.dart';

class ExamRequestPreview extends StatelessWidget {
  final ExamRequestEntity examRequest;
  const ExamRequestPreview({super.key, required this.examRequest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(context),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text('Ziadost o skusku: Prehlad'),
    );
  }

  _buildBody(BuildContext context) {
    int totalExamEventRequests = (examRequest.examsAssigned != null)
        ? examRequest.examsAssigned!.length
        : 0;
    ActionEntity? actionEntity;
    if (totalExamEventRequests > 0) {
      int id = examRequest.examsAssigned![0];
      actionEntity = context
          .read<ActionBloc>()
          .state
          .actions
          .cast<ActionEntity?>()
          .firstWhere((element) => element!.id == id, orElse: () => null);
    }
    return Scrollbar(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('DETAILY'),
            const Divider(),
            Text('Počet žiadostí o termín skúšky: $totalExamEventRequests'),
            (totalExamEventRequests > 0)
                ? _buildExamEventsDetails(actionEntity!)
                : const SizedBox.shrink(),
            const SizedBox(
              height: 20,
            ),
            _buildPridelTerminWidget(context),
          ],
        ),
      ),
    );
  }

  Widget _buildExamEventsDetails(ActionEntity actionEntity) {
    return ActionEventDetailWidget(actionEntity: actionEntity);
  }

  Widget _buildPridelTerminWidget(BuildContext context) {
    List<ActionEntity> actions = context.read<ActionBloc>().state.actions;
    return ElevatedButton(
      onPressed: () => _handlePridajTermin(context, actions),
      child: const Text('Pridaj termin'),
    );
  }

  void _handlePridajTermin(
      BuildContext context, List<ActionEntity> actions) async {
    int? actionId = await showDialog(
      context: context,
      builder: (context) {
        int? actionId;
        return AlertDialog(
          title: const Text('Vyber termin skusky'),
          content: ConstrainedBox(
            constraints: BoxConstraints.expand(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.9),
            child: ActionTableWidget(
              actions: actions,
              clickFunction: (int id) {
                actionId = actions[id].id;
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, null),
              child: const Text('Zrušiť'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, actionId),
              child: const Text('Pridať'),
            ),
          ],
        );
      },
    );
    if (actionId != null) {
      if (!context.mounted) return;
      _emitAddActionEventToExamRequest(context, examRequest, actionId);
    } else {}
  }

  void _emitAddActionEventToExamRequest(
      BuildContext context, ExamRequestEntity examRequest, int actionId) {
    if (examRequest.examsAssigned == null) {
      examRequest =
          examRequest.copyWith(examsAssigned: () => List.filled(1, actionId));
    } else {
      examRequest = examRequest.copyWith(
          examsAssigned: () => [...examRequest.examsAssigned!, actionId]);
    }
    context
        .read<ExamRequestsBloc>()
        .add(UpdateExamRequestEvent(examRequest: examRequest));
  }
}
