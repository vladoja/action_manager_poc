import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({Key? key}) : super(key: key);

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
        'AM - Personal',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return Center(
        child: ListView(
      children: [
        ListTile(title: Text('Person 1')),
        ListTile(title: Text('Person 2'))
      ],
    ));
  }
}
