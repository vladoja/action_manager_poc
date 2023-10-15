import 'package:action_manager_poc/features/app/domain/entities/action.dart';
import 'package:action_manager_poc/features/app/presentation/bloc/action/action_bloc.dart';
import 'package:action_manager_poc/features/app/presentation/pages/akcie/widgets/action_preview_widget.dart';
import 'package:action_manager_poc/features/app/presentation/pages/akcie/widgets/action_table_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AkciePage extends StatefulWidget {
  const AkciePage({super.key});

  @override
  State<AkciePage> createState() => _AkciePageState();
}

class _AkciePageState extends State<AkciePage> {
  int currentIndex = 0;

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
            ActionEntity previewedAction = actions[currentIndex];
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ActionPreviewWidget(
                      action: previewedAction,
                      deleteFunction: _triggerRemoveAction),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ActionTableWidget(
                      actions: actions,
                      clickFunction: _clickFunction,
                    ),
                  ),
                  // const Spacer(),
                ],
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

  _clickFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void _onReloadButtonTapped(BuildContext context) {
    BlocProvider.of<ActionBloc>(context).add(GetActionsEvent());
  }

  _triggerRemoveAction(BuildContext context, ActionEntity action) {
    BlocProvider.of<ActionBloc>(context).add(RemoveActionEvent(action));
    setState(() {
      currentIndex = 0;
    });
  }
}
