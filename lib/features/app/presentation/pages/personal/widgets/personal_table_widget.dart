import 'dart:developer';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/person/person.dart';
import '../../../widgets/table_widget.dart';

class PersonalTableWidget extends StatelessWidget {
  final List<PersonEntity> persons;
  final Function clickFunction;
  final int? highLighted;
  final bool? showCheckboxColumnInTable;
  final List<int>? selectedUsers;

  ///
  /// @showCheckboxColumnInTable - if true, shows checkboxes and sends to the clickFunction List<bool>, otherwise int
  ///
  PersonalTableWidget(
      {super.key,
      required this.persons,
      required this.clickFunction,
      this.highLighted,
      this.showCheckboxColumnInTable = false,
      this.selectedUsers}) {
    selected.addAll(_setSelectedRows(selectedUsers, persons));
    // if (selectedUsers != null && selectedUsers!.isNotEmpty) {
    //   for (var person in persons) {
    //     if (selectedUsers!.cast<int?>().firstWhere(
    //             (element) => element == person.id,
    //             orElse: () => null) !=
    //         null) {
    //       selected.add(true);
    //     } else {
    //       selected.add(false);
    //     }
    //   }
    // } else {
    //   selected
    //       .addAll(List<bool>.generate(persons.length, (int index) => false));
    // }
  }

  final List<DataRow> tableRows = [];
  final List<bool> selected = [];

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

  List<bool> _setSelectedRows(
      List<int>? selectedUsers, List<PersonEntity> persons) {
    List<bool> selectedRows = [];
    if (selectedUsers != null && selectedUsers.isNotEmpty) {
      for (var person in persons) {
        if (selectedUsers.cast<int?>().firstWhere(
                (element) => element == person.id,
                orElse: () => null) !=
            null) {
          selectedRows.add(true);
        } else {
          selectedRows.add(false);
        }
      }
    } else {
      selectedRows
          .addAll(List<bool>.generate(persons.length, (int index) => false));
    }
    return selectedRows;
  }

  void handleClickOnRow(int rowIndex) {
    log("Row with id: $rowIndex clicked");
    if (showCheckboxColumnInTable == true) {
      onSelectChanged(rowIndex);
      clickFunction(selected);
    } else {
      clickFunction(rowIndex);
    }
  }

  List<DataRow> _createTableRows(List personal, {int? highlightedRow}) {
    List<DataRow> tableRows = [];
    for (var i = 0; i < personal.length; i++) {
      tableRows.add(
        PersonalTableRowMapper.personEntityToRow(
            personal[i], columnValues, (b) => handleClickOnRow(i),
            isHighLighted:
                (highlightedRow != null && highlightedRow == i) ? true : false,
            selected: selected[i]),
      );
    }
    return tableRows;
  }

  void onSelectChanged(int index) {
    selected[index] = !selected[index];
  }

  @override
  Widget build(BuildContext context) {
    tableRows.addAll(
      _createTableRows(
        persons,
        highlightedRow: highLighted,
      ),
    );
    return TableWidget(
      columns: tableColumns,
      rows: tableRows,
      showCheckboxColumn: showCheckboxColumnInTable!,
    );
  }
}

class PersonalTableRowMapper {
  static DataRow personEntityToRow(
      PersonEntity model, List<String> columns, void Function(bool?)? onTap,
      {bool isHighLighted = false, bool selected = false}) {
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
      selected: selected,
    );
    return row;
  }
}
