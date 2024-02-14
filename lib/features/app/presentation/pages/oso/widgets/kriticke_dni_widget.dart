import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../config/constants.dart';
import '../../../../../../core/storage/local_storage.dart';
import '../../../bloc/oso/oso/oso_bloc.dart';

class KritickeDniWidget extends StatefulWidget {
  const KritickeDniWidget({super.key});

  @override
  State<KritickeDniWidget> createState() => _KritickeDniWidgetState();
}

class _KritickeDniWidgetState extends State<KritickeDniWidget> {
  String kritickeDniDatumLastCalculation = _getLastCalculationKritickeDni();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  kritickeDniDatumLastCalculation =
                      _onPrepocitajDniPressed(context);
                  setState(() {});
                },
                child: const Text('Prepočítaj dni 📆'))
          ],
        ),
        const SizedBox(
          width: 5,
        ),
        Row(
          children: [
            const Text('Posledný prepočet:'),
            const SizedBox(
              width: 5,
            ),
            Text(kritickeDniDatumLastCalculation),
          ],
        ),
      ],
    );
  }
}

String _onPrepocitajDniPressed(BuildContext context) {
  DateTime currentDateTime = DateTime.now();
  String today = DateFormat('yyyy-MM-dd').format(currentDateTime);
  String dayAndTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(currentDateTime);
  LocalStorage.getInstance().setValue(kKritickeDniDatumKey, dayAndTime);
  // debugPrint('Cas prepoctu: "$dayAndTime"');
  context.read<OsoBloc>().add(RecalculateKritickeDniEvent(today));
  return dayAndTime;
}

String _getLastCalculationKritickeDni() {
  String? lastCalculationDate =
      LocalStorage.getInstance().getValue(kKritickeDniDatumKey);
  return (lastCalculationDate == null) ? 'Neuvedené' : lastCalculationDate;
}
