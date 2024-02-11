import 'package:flutter/material.dart';

import 'widgets/oso_edit_form_widget.dart';

class OsoCreatePage extends StatelessWidget {
  const OsoCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(context),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: Text('Vytvor osobu'),
    );
  }

  Widget _buildBody(BuildContext context) {
    return const OsoEditFormWidget(
      person: null,
    );
  }
}
