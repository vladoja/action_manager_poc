import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

/// Example without datasource
class TableWidget extends StatelessWidget {
  const TableWidget({
    super.key,
    required this.columns,
    required this.rows,
    this.showCheckboxColumn = false,
    this.isHorizontalScrollBarVisible = true,
    this.isVerticalScrollBarVisible = true,
  });
  final List<DataColumn2> columns;
  final List<DataRow> rows;
  final bool showCheckboxColumn;
  final bool isHorizontalScrollBarVisible;
  final bool isVerticalScrollBarVisible;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 600,
        smRatio: 0.75,
        lmRatio: 1.5,
        showCheckboxColumn: showCheckboxColumn,
        columns: columns,
        rows: rows,
        isHorizontalScrollBarVisible: isHorizontalScrollBarVisible,
        isVerticalScrollBarVisible: isVerticalScrollBarVisible,
      ),
    );
  }
}
