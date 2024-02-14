import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../config/constants.dart';
import '../../../../../../core/storage/local_storage.dart';
import '../../../bloc/oso/oso/oso_bloc.dart';

class KritickeDniWidget extends StatelessWidget {
  const KritickeDniWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  _onPrepocitajDniPressed(context);
                },
                child: const Text('Prepocitaj dni 📆'))
          ],
        ),
        const SizedBox(
          width: 5,
        ),
        Row(
          children: [
            const Text('Posledny prepocet:'),
            const SizedBox(
              width: 5,
            ),
            Text(_getLastCalculationKritickeDni()),
          ],
        ),
      ],
    );
  }
}

_onPrepocitajDniPressed(BuildContext context) {
  String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
  // debugPrint('Prepocitivam kriticky datum voci: "$today"');
  String dayAndTime = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());
  LocalStorage.getInstance().setValue(kKritickeDniDatumKey, dayAndTime);
  // debugPrint('Cas prepoctu: "$dayAndTime"');
  context.read<OsoBloc>().add(RecalculateKritickeDniEvent(today));
}

String _getLastCalculationKritickeDni() {
  String? lastCalculationDate =
      LocalStorage.getInstance().getValue(kKritickeDniDatumKey);
  return (lastCalculationDate == null) ? 'Neuvedene' : lastCalculationDate;
}
