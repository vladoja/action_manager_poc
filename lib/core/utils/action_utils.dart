import 'package:intl/intl.dart';

bool isDate(String str) {
  try {
    DateTime.parse(str);
    return true;
  } catch (e) {
    return false;
  }
}

dynamic parseDotValue(String pathToValue, Map<String, dynamic> data,
    {String? sourceNameForErrorLog}) {
  List<String> keys = pathToValue.split('.');
  if (keys.length == 1) {
    String key = keys[0];
    if (data.containsKey(key)) {
      return data[key];
    } else {
      var sourceName =
          (sourceNameForErrorLog != null && sourceNameForErrorLog.isNotEmpty)
              ? '[$sourceNameForErrorLog] '
              : '';
      throw Exception("${sourceName}Map object is missing key:'$key'");
    }
  } else {
    dynamic v = data;
    while (keys.isNotEmpty) {
      String currentKey = keys.removeAt(0);
      if (v is Map) {
        Map<String, dynamic> temp = Map.castFrom(v);
        if (temp.containsKey(currentKey) == false) {
          var sourceName = (sourceNameForErrorLog != null &&
                  sourceNameForErrorLog.isNotEmpty)
              ? '[$sourceNameForErrorLog] '
              : '';
          throw Exception(
              "${sourceName}Map object is missing key:'$currentKey' from composed key: '$pathToValue");
        }
      }
      v = v[currentKey];
    }
    return v;
  }
}

/// Computes the day difference between two dates. If [date2] is later, than the result is positive.
///
/// [date1] is earliar date,
/// [date2] is later date,
/// [date1Format] date format,
/// [date2Format] date format.
int? getDayDifference(String date1, String? date2,
    {String date1Format = 'yyyy-MM-dd', String date2Format = 'yyyy-MM-dd'}) {
  if (date2 == null || date2.isEmpty) {
    return null;
  }
  DateTime date2DT = DateFormat(date2Format).parse(date2);
  int dayDifference =
      -1 * DateFormat(date1Format).parse(date1).difference(date2DT).inDays;
  return dayDifference;
}
