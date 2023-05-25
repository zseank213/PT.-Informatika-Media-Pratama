import 'dart:convert';

import 'package:ptinformatikamediapratama/lib.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsStorage {
  LoginModel? userProfile;

  static Future<SharedPreferences> get sharedPrefs => SharedPreferences.getInstance();

  //UserProfile
  static Future<String?> getUserProfile() async => (await sharedPrefs).getString('kUserProfile');

  static Future setUserProfile({required Map<String, dynamic> data}) async => (await sharedPrefs).setString('kUserProfile', jsonEncode(data));

  static Future clearUserProfile() async => (await sharedPrefs).remove('kUserProfile');
}
