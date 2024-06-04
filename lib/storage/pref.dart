import 'package:shared_preferences/shared_preferences.dart';
import 'package:bee_ui/helper/helper.dart';

class PrefKeys {
  static String list(String label) {
    return "list_${label.replaceAll(" ", "_")}";
  }
}

class PrefStorage {
  static SharedPreferences? _pref;

  static Future<void> _init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static Future<void> saveList(String key, List<String> value) async {
    try {
      if (_pref == null) await _init();
      await _pref!.setStringList(key, value);
    } catch (e) {
      logs(e);
    }
  }

  static Future<List<String>> storeList(String key) async {
    try {
      if (_pref == null) await _init();
      return _pref!.getStringList(key) ?? [];
    } catch (e) {
      logs(e);
      return [];
    }
  }

  static Future<void> remove(String key) async {
    try {
      if (_pref == null) await _init();
      _pref!.remove(key);
    } catch (e) {
      logs(e);
    }
  }
}
