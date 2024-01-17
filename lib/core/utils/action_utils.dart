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
