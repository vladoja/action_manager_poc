import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/oso/oso.dart';
import '../../../widgets/table_widget.dart';

class OsoTableWidget extends StatelessWidget {
  final List<OsoEntity> osoby;
  final Function clickFunction;
  final int? highLighted;
  final bool? showCheckboxColumnInTable;

  final List<DataRow> tableRows = [];
  final List<bool> selected = [];

  OsoTableWidget(
      {super.key,
      required this.osoby,
      required this.clickFunction,
      this.highLighted,
      this.showCheckboxColumnInTable = false}) {
    selected.addAll(List<bool>.generate(osoby.length, (int index) => false));
  }

  final List<DataColumn2> tableColumns = const [
    DataColumn2(
      // size: ColumnSize.L,
      label: Text('PEK'),
    ),
    DataColumn2(
      label: Text('Platnost OSV'),
    ),
    DataColumn2(
      label: Text('Meno'),
    ),
    DataColumn2(
      label: Text('Priezvisko'),
    ),
    DataColumn2(
      size: ColumnSize.S,
      label: Text('Titul'),
    ),
    DataColumn2(
      label: Text('Datum Narodenia'),
    ),
  ];

  final List<String> columnValues = [
    "pek",
    "platnostOsvedceniaDatum",
    "meno",
    "priezvisko",
    "titul",
    "datumNarodenia",
  ];

  void handleClickOnRow(int rowIndex) {
    if (showCheckboxColumnInTable == true) {
      onSelectChanged(rowIndex);
      clickFunction(selected);
    } else {
      clickFunction(rowIndex);
    }
  }

  void onSelectChanged(int index) {
    selected[index] = !selected[index];
  }

  List<DataRow> _createTableRows(List personal, {int? highlightedRow}) {
    List<DataRow> tableRows = [];
    for (var i = 0; i < personal.length; i++) {
      tableRows.add(
        OsoTableRowMapper.osobaEntityToRow(
            personal[i], columnValues, (b) => handleClickOnRow(i),
            isHighLighted:
                (highlightedRow != null && highlightedRow == i) ? true : false,
            selected: selected[i]),
      );
    }
    return tableRows;
  }

  @override
  Widget build(BuildContext context) {
    tableRows.addAll(_createTableRows(osoby, highlightedRow: highLighted));
    return TableWidget(columns: tableColumns, rows: tableRows);
  }
}

class OsoTableRowMapper {
  static DataRow osobaEntityToRow(
      OsoEntity model, List<String> columns, void Function(bool?)? onTap,
      {bool isHighLighted = false, bool selected = false}) {
    List<DataCell> cells = List<DataCell>.empty(growable: true);
    Map<String, dynamic> personJSON = model.toMap();
    for (var columnValue in columns) {
      if (personJSON.containsKey(columnValue) == false) {
        throw "OsoEntity object doesnt contains key:'$columnValue'";
      }
      cells.add(DataCell(Text(personJSON[columnValue] ?? 'N/A')));
    }

    DataRow row = DataRow(
      onSelectChanged: (onTap != null) ? onTap : null,
      cells: cells,
      selected: selected,
    );
    return row;
  }
}