import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../bloc/oso/oso/oso_bloc.dart';

class KritickeDniWidget extends StatelessWidget {
  const KritickeDniWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
            onPressed: () {
              _onPrepocitajDniPressed(context);
            },
            child: const Text('Prepocitaj dni 📆'))
      ],
    );
  }
}

_onPrepocitajDniPressed(BuildContext context) {
  String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
  debugPrint('Prepocitivam kriticky datum voci: "$today"');
  context.read<OsoBloc>().add(RecalculateKritickeDniEvent(today));
}
