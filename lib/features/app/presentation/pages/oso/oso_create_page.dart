import 'package:flutter/material.dart';

class OsoCreatePage extends StatelessWidget {
  const OsoCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: Placeholder(),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: Text('Vytvor osobu'),
    );
  }
}
