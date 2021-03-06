import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
import 'logger.dart';

class SharedPreferencesHelper {
  // Logger Head value
  final logger = getLogger("SharedPreferencesHelper()");

  // Shared Pref
  SharedPreferences _prefs;

  static const String _pref_user_data = "_pref_user_data";
  static const String _onboarding_status = "_onboarding_status";

  SharedPreferencesHelper() {
    _init();
  }

  _init() async {
    _prefs = await SharedPreferences.getInstance();
    logger.i("Constructed");
  }

  Future<User> getLocalUserData() async {
    return _prefs.getString(_pref_user_data) != null
        ? userFromJson(_prefs.getString(_pref_user_data))
        : null;
  }

  Future<bool> setLocalUserData(User user) async {
    return _prefs.setString(_pref_user_data, userToJson(user));
  }

  Future<bool> setOnboardingStatus() async {
    return _prefs.setBool(_onboarding_status, true);
  }

  Future<bool> getOnboardingStatus() async {
    return _prefs.getBool(_onboarding_status);
  }
}
