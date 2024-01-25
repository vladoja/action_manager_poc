import 'package:flutter/material.dart';

class ExamRequestDetailsPage extends StatelessWidget {
  const ExamRequestDetailsPage({super.key});

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
    return Scrollbar(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('DETAILY'),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
