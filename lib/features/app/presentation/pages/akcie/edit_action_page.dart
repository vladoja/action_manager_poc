import 'package:action_manager_poc/features/app/domain/entities/action.dart';
import 'package:flutter/material.dart';

class EditActionPage extends StatelessWidget {
  final ActionEntity? action;
  const EditActionPage({super.key, this.action});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(context, _formKey),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
        title: Text((action == null) ? 'Vytvor Akciu' : 'Edituj Akciu'));
  }

  _buildBody(BuildContext context, GlobalKey<FormState> formKey) {
    return Center(
      child: const Text('Under construction'),
    );
  }
}
