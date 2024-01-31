import 'package:action_manager_poc/config/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/oso/oso/oso_bloc.dart';
import 'widgets/oso_table_widget.dart';

class OSOPage extends StatelessWidget {
  final int? selectedOSOid;
  const OSOPage({super.key, this.selectedOSOid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      floatingActionButton: IconButton(
          onPressed: () {
            _onCreateNewOso(context);
          },
          icon: const Icon(Icons.add_circle_outline_sharp)),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'AM - Zoznamy / OSO (Odborne Spôsobilé Osoby)',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _buildBody(BuildContext context) {
    // watch
    final osoby = context.watch<OsoBloc>().state.oso;

    int? selectedRowId;
    for (int i = 0; i < osoby.length; i++) {
      if (osoby[i].id == selectedOSOid) {
        selectedRowId = i;
        break;
      }
    }
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Search OSO'),
          Expanded(
            child: OsoTableWidget(
              osoby: osoby,
              clickFunction: (int id) {
                debugPrint('Oso Table. Clicked id: $id');
              },
              highLighted: selectedRowId,
            ),
          ),
        ],
      ),
    );
  }

  void _onCreateNewOso(BuildContext context) {
    GoRouter.of(context).go('${AppRoutes.navOSOZoznam}/New');
  }
}
