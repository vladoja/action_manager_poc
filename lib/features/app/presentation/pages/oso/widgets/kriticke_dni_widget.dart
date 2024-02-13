import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  debugPrint('Prepocitivam datumu');
  context.read<OsoBloc>().add(const RecalculateKritickeDniEvent('2024-02-12'));
}
