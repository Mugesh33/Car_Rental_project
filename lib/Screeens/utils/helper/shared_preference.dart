import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


const kUserLoggedIn = 'user_logged_in';
const kUserLoginInfo = "user_login_info";
const kSavedCardList = "saved_card_list";
const kSelectedSportsList = "selected_sports_list";
const kSelectedLanguage = 'selected_language';
const kUserId = 'user_id';
const kUserWalletAmount = 'user_wallet_amount';
const kUserEmail = 'user_email';

Future<String> getString(String key, {String defValue = ''}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // Return string
  String value = prefs.getString(key) ?? defValue;
  return value;
}

// put string
void setString(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

// get bool
Future<bool> getBool(String key, {bool defValue = false}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // Return bool
  bool boolValue = prefs.getBool(key) ?? defValue;
  return boolValue;
}

// put bool
void setBool(String key, bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, value);
}

// get double
Future<double> getDouble(String key, {double defValue = 0.0}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // Return bool
  double value = prefs.getDouble(key) ?? defValue;
  return value;
}

// put bool
void setDouble(String key, double value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setDouble(key, value);
}

// put int
void setInt(String key, int value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt(key, value);
}

void setStringList(String key, List<String> value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList(key, value);
}

// put userid
void setUserId(String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(kUserId, value);
}

//
Future<String> getUserId({String defValue = ''}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String value = prefs.getString(kUserId) ?? defValue;
  return value;
}

// put userid
void setUserWalletAmount(String? value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(kUserWalletAmount, value ?? '');
}

//
Future<String> getUserWalletAmount({String defValue = ''}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String value = prefs.getString(kUserWalletAmount) ?? defValue;
  return value;
}

//Put language code
void setLanguage(String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(kSelectedLanguage, value);
}

//Get selected language code
Future<String> getLanguage({String defValue = 'email'}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String value = prefs.getString(kSelectedLanguage) ?? defValue;
  return value;
}

void setEmail(String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(kUserEmail, value);
}

//Get selected language code
Future<String> getEmail({String defValue = ''}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String value = prefs.getString(kUserEmail) ?? defValue;
  return value;
}
