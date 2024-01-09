import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/osoby/osoby/osoby_bloc.dart';

class OsobyPage extends StatelessWidget {
  final int? selectedPersonId;
  const OsobyPage({super.key, this.selectedPersonId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'AM - Zoznamy / Osoby',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _buildBody(BuildContext context) {
    // watch
    final persons = context.read<OsobyBloc>().state.osoby;
    print('Osoby total: ${persons.length}');

    int? selectedRowId;
    for (int i = 0; i < persons.length; i++) {
      if (persons[i].id == selectedPersonId) {
        selectedRowId = i;
        break;
      }
    }

    return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      const Text('Search osoby'),
    ]));
  }
}
