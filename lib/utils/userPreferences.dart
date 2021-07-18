import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences _preferences;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setTheme(int opc) async {
    await _preferences.setInt("theme", opc);
  }

  static int getTheme() {
    return _preferences.getInt("theme");
  }
}
