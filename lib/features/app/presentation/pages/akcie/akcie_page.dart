import 'package:action_manager_poc/features/app/domain/entities/action.dart';
import 'package:action_manager_poc/features/app/presentation/bloc/action/action_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AkciePage extends StatelessWidget {
  const AkciePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      floatingActionButton: IconButton(
        icon: const Icon(Icons.add_rounded),
        tooltip: "Pridaj Akciu",
        onPressed: () => {Navigator.pushNamed(context, '/Akcie/New')},
      ),
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
    return BlocBuilder<ActionBloc, ActionState>(
      builder: (_, state) {
        if (state is ActionLoading) {
          return Center(
            child: IconButton(
                onPressed: () {
                  _onReloadButtonTapped(context);
                },
                icon: const Icon(Icons.refresh),
                tooltip: "Tap me"),
          );
        } else if (state is ActionDone) {
          List<ActionEntity> actions = state.actions;
          if (actions.isEmpty) {
            return const Center(
              child: Text('No actions yet'),
            );
          } else {
            return Center(
              child: ListView.builder(
                itemCount: actions.length,
                itemBuilder: (context, index) {
                  return _createPersonTile(context, actions[index]);
                },
              ),
            );
          }
        }
        return const Center(
          child: Text(
            "Warning. Something went wrong!",
            style: TextStyle(color: Colors.red),
          ),
        );
      },
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

  void _onReloadButtonTapped(BuildContext context) {
    BlocProvider.of<ActionBloc>(context).add(GetActionsEvent());
  }
}
