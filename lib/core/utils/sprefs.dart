import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesCP {
  sprefsSetBool({required String key, required bool value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  sprefsGetBool({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }
}

SharedPreferencesCP sprefsCP = SharedPreferencesCP();
