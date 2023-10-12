import 'package:action_manager_poc/features/app/domain/entities/action.dart';
import 'package:action_manager_poc/temp/dummy_actions.dart';
import 'package:action_manager_poc/temp/dummy_personal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AkciePage extends StatelessWidget {
  const AkciePage({super.key});

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
        'AM - Akcie',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _buildBody(BuildContext context) {
    List<ActionEntity> actions = actions_data_temp.toList();
    return Center(
      child: ListView.builder(
        itemCount: actions.length,
        itemBuilder: (context, index) {
          return _createPersonTile(context, actions[index]);
        },
      ),
    );
  }

  _createPersonTile(BuildContext context, ActionEntity action) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(action.name),
          Text(action.eventDate),
          Text(action.licenceEvent)
        ],
      ),
    );
  }
}
