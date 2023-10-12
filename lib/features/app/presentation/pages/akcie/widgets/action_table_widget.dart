import 'package:action_manager_poc/features/app/domain/entities/action.dart';
import 'package:action_manager_poc/features/app/presentation/widgets/table_widget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class ActionTableWidget extends StatelessWidget {
  final List<ActionEntity> actions;
  ActionTableWidget({super.key, required this.actions});

  final List<DataRow> tableRows = [];

  final List<DataColumn2> tableColumns = const [
    DataColumn2(
      size: ColumnSize.L,
      label: Text('Termín názov'),
    ),
    DataColumn2(
      label: Text('Dátum'),
    ),
    DataColumn2(
      label: Text('Oprávnenie'),
    ),
    DataColumn2(
      label: Text('Konanie'),
    ),
    DataColumn2(
      label: Text('Etapa'),
      // numeric: true,
      size: ColumnSize.L,
    ),
    DataColumn2(
      label: Text('Vytvoril'),
      // numeric: true,
      size: ColumnSize.L,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return TableWidget(columns: tableColumns, rows: tableRows);
  }
}
