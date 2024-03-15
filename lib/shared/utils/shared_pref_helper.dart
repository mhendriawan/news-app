import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  final SharedPreferences preferences;

  SharedPrefHelper({required this.preferences});

  static const _lastChecked = "last_checked";
  static const _checkInterval = "check_interval";
  static const _data = "data";

  // Interval 600000 means handle cache for 600000 milliseconds or 10 minutes
  Future<bool> storeCache(
    String key,
    String json, {
    required int lastChecked,
    int interval = 600000,
  }) {
    return preferences.setString(
      key,
      jsonEncode(
        {
          _lastChecked: lastChecked,
          _checkInterval: interval,
          _data: json,
        },
      ),
    );
  }

  Future<String> getCache(String key) async {
    Map map = jsonDecode(preferences.getString(key) ?? "");
    // if outdated, clear and return null
    var lastChecked = map[_lastChecked];
    var interval = map[_checkInterval];
    if ((DateTime.now().millisecondsSinceEpoch - lastChecked) > interval) {
      preferences.remove(key);
      return map[_data];
    }
    return map[_data];
  }

  Future<Map> getFullCache(String key) async {
    Map map = jsonDecode(preferences.getString(key) ?? "");
    // if outdated, clear and return null
    var lastChecked = map[_lastChecked];
    var interval = map[_checkInterval];
    if ((DateTime.now().millisecondsSinceEpoch - lastChecked) > interval) {
      preferences.remove(key);
      return map;
    }

    return map;
  }
}
