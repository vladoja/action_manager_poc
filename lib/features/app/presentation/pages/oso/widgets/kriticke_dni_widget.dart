import 'package:flutter/material.dart';

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
}
