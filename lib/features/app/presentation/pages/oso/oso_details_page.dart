import 'package:flutter/material.dart';

import '../../../domain/entities/oso/oso.dart';
import 'widgets/oso_edit_form_widget.dart';

class OsoDetailsPage extends StatelessWidget {
  final OsoEntity oso;
  const OsoDetailsPage({super.key, required this.oso});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(context),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: Text('Edituj osobu'),
    );
  }

  Widget _buildBody(BuildContext context) {
    return OsoEditFormWidget(
      person: oso,
    );
  }
}
