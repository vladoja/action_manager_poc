import 'package:flutter/material.dart';

class ExamRequestsPage extends StatelessWidget {
  const ExamRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const Center(child: Text('Ziadosti o skusku')),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'AM - Zoznamy / Žiadosti o skúšku',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
