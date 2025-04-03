import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  
  static SharedPreferences? prefs;

  Future<void> initialize() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> isLoggedIn() async {
    return prefs?.getBool('isLoggedIn') ?? false;
  }

  Future<void> saveLoginState(String token, String username) async {
    await prefs?.setBool('isLoggedIn', true);
    await prefs?.setString('token', token);
    await prefs?.setString('username', username);
  }

  Future<String?> getUserName() async {
    return prefs?.getString('username');
  }

  String? getToken() {
    return prefs?.getString('token');
  }
}
