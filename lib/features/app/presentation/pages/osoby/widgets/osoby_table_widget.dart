import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/osoba/osoba.dart';
import '../../../widgets/table_widget.dart';

class OsobyTableWidget extends StatefulWidget {
  final List<OsobaEntity> persons;
  final Function clickFunction;
  final int? highLighted;
  final bool? showCheckboxColumnInTable;

  ///
  /// @showCheckboxColumnInTable - if true, shows checkboxes and sends to the clickFunction List<bool>, otherwise int
  ///
  const OsobyTableWidget(
      {super.key,
      required this.persons,
      required this.clickFunction,
      this.highLighted,
      this.showCheckboxColumnInTable = false});

  @override
  State<OsobyTableWidget> createState() => _OsobyTableWidgetState();
}

class _OsobyTableWidgetState extends State<OsobyTableWidget> {
  List<DataRow> tableRows = [];
  List<bool>? selected;

  @override
  void initState() {
    selected = List<bool>.generate(widget.persons.length, (int index) => false);
    super.initState();
  }

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
      label: Text('Pracovisko'),
      // numeric: true,
      size: ColumnSize.L,
    ),
  ];

  final List<String> columnValues = [
    "firstName",
    "lastName",
    "title",
    "employer",
  ];

  void handleClickOnRow(int rowIndex) {
    print("Row with id: $rowIndex clicked");
    // tableRows[rowIndex]
    if (widget.showCheckboxColumnInTable == true) {
      onSelectChanged(rowIndex);
      widget.clickFunction(selected);
    } else {
      widget.clickFunction(rowIndex);
    }
  }

  void onSelectChanged(int index) {
    setState(() {
      selected![index] = !selected![index];
      // log('Row $index has new checked value: ${selected![index]}');
    });
  }

  List<DataRow> _createTableRows(List personal, {int? highlightedRow}) {
    List<DataRow> tableRows = [];
    for (var i = 0; i < personal.length; i++) {
      tableRows.add(
        PersonalTableRowMapper.osobaEntityToRow(
            personal[i], columnValues, (b) => handleClickOnRow(i),
            isHighLighted:
                (highlightedRow != null && highlightedRow == i) ? true : false,
            selected: selected![i]),
      );
    }
    return tableRows;
  }

  @override
  Widget build(BuildContext context) {
    tableRows =
        _createTableRows(widget.persons, highlightedRow: widget.highLighted);
    return TableWidget(
      columns: tableColumns,
      rows: tableRows,
      showCheckboxColumn: widget.showCheckboxColumnInTable!,
    );
  }
}

class PersonalTableRowMapper {
  static DataRow osobaEntityToRow(
      OsobaEntity model, List<String> columns, void Function(bool?)? onTap,
      {bool isHighLighted = false, bool selected = false}) {
    List<DataCell> cells = List<DataCell>.empty(growable: true);
    Map<String, dynamic> personJSON = model.toMap();
    for (var columnValue in columns) {
      if (personJSON.containsKey(columnValue) == false) {
        throw "OsobaEntity object doesnt contains key:'$columnValue'";
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
