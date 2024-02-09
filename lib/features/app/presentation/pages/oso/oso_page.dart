import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../domain/entities/oso/oso.dart';
import '../../bloc/oso/oso/oso_bloc.dart';
import '../../bloc/oso/oso_filtered/oso_filtered_bloc.dart';
import 'widgets/oso_table_widget.dart';
import 'widgets/search_oso_widget.dart';

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
    final osoby = context.watch<OsoFilteredBloc>().state.osoFiltered;

    int? selectedRowId;
    for (int i = 0; i < osoby.length; i++) {
      if (osoby[i].id == selectedOSOid) {
        selectedRowId = i;
        break;
      }
    }
    return MultiBlocListener(
      listeners: [
        BlocListener<OsoBloc, OsoState>(
          listener: (context, state) {
            context
                .read<OsoFilteredBloc>()
                .add(CalculateFilteredOsoEvent(osoFiltered: state.oso));
          },
        ),
      ],
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SearchOsoWidget(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: OsoTableWidget(
                osoby: osoby,
                clickFunction: (int id) {
                  debugPrint('Oso Table. Clicked id: $id');
                  OsoEntity previevedOso = osoby[id];
                  _goToOsoDetailsPage(context, previevedOso);
                },
                highLighted: selectedRowId,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onCreateNewOso(BuildContext context) {
    GoRouter.of(context).go('${AppRoutes.navOSOZoznam}/New');
  }

  void _goToOsoDetailsPage(BuildContext context, OsoEntity oso) {
    GoRouter.of(context).go('${AppRoutes.navOSOZoznam}/Details', extra: oso);
  }
}
