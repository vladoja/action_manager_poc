import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../domain/entities/exam/exam_request.dart';

class ExamRequestDetailsPage extends StatelessWidget {
  final ExamRequestEntity examRequest;
  const ExamRequestDetailsPage({super.key, required this.examRequest});

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
            _buildGoToDetailsWidget(context)
          ],
        ),
      ),
    );
  }

  Widget _buildGoToDetailsWidget(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _handleGoToDetailsPage(context);
      },
      child: const Text('Vytvor novu ziadost'),
    );
  }

  void _handleGoToDetailsPage(BuildContext context) {
    GoRouter.of(context).go(
        '${AppRoutes.navZoznamyZiadostiOSkusku}/Details/NovaZiadost',
        extra: examRequest);
  }
}
