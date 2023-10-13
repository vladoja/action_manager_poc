import 'dart:developer';

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
    // DataColumn2(
    //   label: Text('Vytvoril'),
    //   // numeric: true,
    //   size: ColumnSize.L,
    // ),
  ];

  final List<String> columnValues = [
    "name",
    "actionDate",
    "licenceEvent",
    "licenceType",
    "licenceCourse",
    // "created_by"
  ];

  void handleClickOnRow(int rowIndex) {
    log("Row with id: $rowIndex clicked");
  }

  List<DataRow> createTableRows(List<ActionEntity> actions) {
    List<DataRow> tableRows = [];
    for (var i = 0; i < actions.length; i++) {
      log(actions[i].toJson().toString());
      tableRows.add(
          ActionTableRowMapper.actionEntityToRow(actions[i], columnValues, (b) {
        handleClickOnRow(i);
      }));
    }
    return tableRows;
  }

  @override
  Widget build(BuildContext context) {
    tableRows.addAll(createTableRows(actions));
    return TableWidget(columns: tableColumns, rows: tableRows);
  }
}

class ActionTableRowMapper {
  static DataRow actionEntityToRow(
      ActionEntity model, List<String> columns, void Function(bool?)? onTap) {
    List<DataCell> cells = List<DataCell>.empty(growable: true);
    Map<String, dynamic> actionJSON = model.toJson();
    for (var columnValue in columns) {
      if (actionJSON.containsKey(columnValue) == false) {
        throw "ActionEntity object doesnt contains key:'$columnValue'";
      }
      cells.add(DataCell(Text(actionJSON[columnValue])));
    }

    DataRow row =
        DataRow(onSelectChanged: (onTap != null) ? onTap : null, cells: cells);
    return row;
  }
}
