// import 'package:action_manager_poc/core/utils/action_utils.dart';
import '../../../../lib/core/utils/action_utils.dart';
import '../../../../lib/temp/dummy_ziadosti_o_skusku.dart';
import '../../../../lib/temp/dummy_osoby.dart';
import 'package:flutter_test/flutter_test.dart';

Map<String, dynamic> loadData() {
  var examRequest = exam_requests_data_temp[0];
  final osoba = zoznamy_osoby_dummy[0];
  examRequest = examRequest.copyWith(user: osoba);
  return examRequest.toMap();
}

void main() {
  test('Access top level value in JSON type object', () {
    Map<String, dynamic> nestedObject = loadData();
    const pathToValue = "userId";
    var result = parseDotValue(pathToValue, nestedObject);
    // print(nestedObject);
    expect(result, 1);
  });

  test('Access nested value in JSON type object', () {
    Map<String, dynamic> nestedObject = loadData();
    const pathToValue = "user.firstName";
    var result = parseDotValue(pathToValue, nestedObject);
    // print(nestedObject);
    expect(result, "Martin");
  });

  test('Should throw exception on non existing top level key', () {
    Map<String, dynamic> nestedObject = loadData();
    const pathToValue = "nonExistingPath";
    expect(
        () => parseDotValue(pathToValue, nestedObject,
            sourceNameForErrorLog: 'UnitTest'),
        throwsA(predicate((p0) => p0 is Exception)));
  });

  test('Should throw exception on non existing second level key', () {
    Map<String, dynamic> nestedObject = loadData();
    const pathToValue = "user.nonExistingPath";
    expect(() => parseDotValue(pathToValue, nestedObject),
        throwsA(predicate((p0) => p0 is Exception)));
  });
}
