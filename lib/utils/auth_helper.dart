import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {
  Future<void> logoutAsync() async {
    // Clear shared preference.
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.clear();
  }
}
