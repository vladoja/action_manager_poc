import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/delete_alert.dart';
import '../../../domain/entities/oso/oso.dart';
import '../../bloc/oso/oso/oso_bloc.dart';
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
      title: const Text('Edituj OSO (Odobrne Spôsobilá Osoba)'),
      actions: [
        IconButton(
          icon:
              const Icon(Icons.delete, color: Color.fromARGB(255, 212, 34, 22)),
          onPressed: () async {
            bool result = await showDialog(
              context: context,
              builder: (ctx) => createDeleteDialog(ctx),
            );
            if (result) {
              _onDeleteButtonTapped(context, oso);
              if (GoRouter.of(context).canPop()) {
                GoRouter.of(context).pop();
              }
            }
          },
        )
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return OsoEditFormWidget(
      person: oso,
    );
  }

  void _onDeleteButtonTapped(BuildContext context, OsoEntity osoba) {
    BlocProvider.of<OsoBloc>(context).add(RemoveOsoInOso(osoba));
  }
}
