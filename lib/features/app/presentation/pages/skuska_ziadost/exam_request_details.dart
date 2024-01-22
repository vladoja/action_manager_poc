import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/action.dart';
import '../../../domain/entities/exam/exam_request.dart';
import '../../bloc/action/action_bloc.dart';
import '../akcie/widgets/action_table_widget.dart';

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
            _buildPridelTerminWidget(context),
          ],
        ),
      ),
    );
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
    List<int> personIdsToAdd = await showDialog(
      context: context,
      builder: (context) {
        List<int> selectedPersonIds = [];
        return AlertDialog(
          title: const Text('Vyber termin skusky'),
          content: ConstrainedBox(
            constraints: BoxConstraints.expand(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.9),
            child: ActionTableWidget(
              actions: actions,
              clickFunction: (int id) {
                // Najviac jeden termin je mozne priradit. Preto: clear()
                selectedPersonIds.clear();
                selectedPersonIds.add(actions[id].id);
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, <int>[]),
              child: const Text('Zrušiť'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, selectedPersonIds),
              child: const Text('Pridať'),
            ),
          ],
        );
      },
    );
    if (personIdsToAdd.isNotEmpty) {
      // print('Pridany personal: $personIdsToAdd');
      if (!context.mounted) return;
      // _emitAddPersonalToActionEvent(context, personIdsToAdd, persons, action);
    } else {
      // print('Nikto nebol pridany');
    }
  }
}
