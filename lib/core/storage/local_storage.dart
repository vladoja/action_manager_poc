class LocalStorage {
  late Map<String, String> map;
  static LocalStorage? _instance;
  LocalStorage() {
    map = <String, String>{};
  }

  String? getValue(String key) {
    return map[key];
  }

  setValue(String key, String value) {
    map[key] = value;
  }

  removeValue(String key) {
    map.remove(key);
  }

  static LocalStorage getInstance() {
    return _instance ??= LocalStorage();
  }
}
