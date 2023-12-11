import 'dart:developer';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/person/person.dart';
import '../../../widgets/table_widget.dart';

class PersonalTableWidget extends StatelessWidget {
  final List<PersonEntity> persons;
  final Function clickFunction;
  final int? highLighted;
  PersonalTableWidget(
      {super.key,
      required this.persons,
      required this.clickFunction,
      this.highLighted});

  final List<DataRow> tableRows = [];

  final List<DataColumn2> tableColumns = const [
    DataColumn2(
      size: ColumnSize.L,
      label: Text('Meno'),
    ),
    DataColumn2(
      label: Text('Priezvisko'),
    ),
    DataColumn2(
      label: Text('Titul'),
    ),
    DataColumn2(
      label: Text('Oprávnenie'),
      // numeric: true,
      size: ColumnSize.L,
    ),
  ];

  final List<String> columnValues = [
    "firstName",
    "lastName",
    "title",
    "role",
  ];

  void handleClickOnRow(int rowIndex) {
    log("Row with id: $rowIndex clicked");
    // tableRows[rowIndex]
    clickFunction(rowIndex);
  }

  List<DataRow> _createTableRows(List personal, {int? highlightedRow}) {
    List<DataRow> tableRows = [];
    for (var i = 0; i < personal.length; i++) {
      tableRows.add(PersonalTableRowMapper.personEntityToRow(
          personal[i], columnValues, (b) => handleClickOnRow(i)));
    }
    return tableRows;
  }

  @override
  Widget build(BuildContext context) {
    tableRows.addAll(_createTableRows(persons, highlightedRow: highLighted));
    return TableWidget(columns: tableColumns, rows: tableRows);
  }
}

class PersonalTableRowMapper {
  static DataRow personEntityToRow(
      PersonEntity model, List<String> columns, void Function(bool?)? onTap,
      {bool isHighLighted = false}) {
    List<DataCell> cells = List<DataCell>.empty(growable: true);
    Map<String, dynamic> personJSON = model.toMap();
    for (var columnValue in columns) {
      if (personJSON.containsKey(columnValue) == false) {
        throw "PersonEntity object doesnt contains key:'$columnValue'";
      }
      cells.add(DataCell(Text(personJSON[columnValue] ?? 'N/A')));
    }

    DataRow row = DataRow(
        onSelectChanged: (onTap != null) ? onTap : null,
        cells: cells,
        selected: isHighLighted);
    return row;
  }
}
