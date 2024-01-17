import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/action_utils.dart';
import '../../../../domain/entities/exam/exam_request.dart';
import '../../../widgets/table_widget.dart';

class ExamRequestsTableWidget extends StatelessWidget {
  final List<ExamRequestEntity> examRequests;
  final Function clickFunction;
  final int? highLighted;
  final bool? showCheckboxColumnInTable;

  final List<DataRow> tableRows = [];
  final List<bool> selected = [];

  ExamRequestsTableWidget(
      {super.key,
      required this.examRequests,
      required this.clickFunction,
      this.highLighted,
      this.showCheckboxColumnInTable}) {
    selected
        .addAll(List<bool>.generate(examRequests.length, (int index) => false));
  }

  final List<DataColumn2> tableColumns = const [
    DataColumn2(
      size: ColumnSize.S,
      label: Text('ID'),
    ),
    DataColumn2(
      label: Text('USER ID'),
    ),
    DataColumn2(
      label: Text('Priezvisko'),
    ),
    DataColumn2(
      label: Text('Meno'),
    ),
    DataColumn2(
      label: Text('Typ'),
    ),
    DataColumn2(
      label: Text('Status'),
    ),
    DataColumn2(
      label: Text('Expiracia'),
      // numeric: true,
      size: ColumnSize.L,
    ),
  ];

  final List<String> columnValues = [
    "id",
    "userId",
    "user.lastName",
    "user.firstName",
    "typSkolenia",
    "examRequestStatus",
    "licenceExpirationDate",
  ];

  void handleClickOnRow(int rowIndex) {
    print("Row with id: $rowIndex clicked");
    // tableRows[rowIndex]
    if (showCheckboxColumnInTable == true) {
      onSelectChanged(rowIndex);
      clickFunction(selected);
    } else {
      clickFunction(rowIndex);
    }
  }

  void onSelectChanged(int index) {
    selected[index] = !selected[index];
    // log('Row $index has new checked value: ${selected![index]}');
  }

  List<DataRow> _createTableRows(List examRequests, {int? highlightedRow}) {
    List<DataRow> tableRows = [];
    for (var i = 0; i < examRequests.length; i++) {
      tableRows.add(
        ExamRequestTableRowMapper.examRequestEntityToRow(
            examRequests[i], columnValues, (b) => handleClickOnRow(i),
            isHighLighted:
                (highlightedRow != null && highlightedRow == i) ? true : false,
            selected: selected[i]),
      );
    }
    return tableRows;
  }

  @override
  Widget build(BuildContext context) {
    tableRows
        .addAll(_createTableRows(examRequests, highlightedRow: highLighted));
    return TableWidget(columns: tableColumns, rows: tableRows);
  }
}

class ExamRequestTableRowMapper {
  static DataRow examRequestEntityToRow(ExamRequestEntity model,
      List<String> columns, void Function(bool?)? onTap,
      {bool isHighLighted = false, bool selected = false}) {
    print('ExamRequestEntity: $model');
    List<DataCell> cells = List<DataCell>.empty(growable: true);
    Map<String, dynamic> personJSON = model.toMap();
    for (var columnValue in columns) {
      var value = parseDotValue(columnValue, personJSON,
          sourceNameForErrorLog: "ExamRequestsTableWidget");
      if (value != null) {
        cells.add(DataCell(Text(value.toString())));
      } else {
        cells.add(const DataCell(Text('N/A')));
      }
    }

    DataRow row = DataRow(
      onSelectChanged: (onTap != null) ? onTap : null,
      cells: cells,
      selected: selected,
    );
    return row;
  }
}
