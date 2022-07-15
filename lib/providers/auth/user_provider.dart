import 'package:blinkapp/main.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final userProvider = ChangeNotifierProvider(
  (ref) => UserProvider(
    ref.watch(sharedPreferencesProvider),
  ),
);

class UserProvider extends ChangeNotifier {
  UserProvider(this._prefs);

  final SharedPreferences _prefs;

  String? getClientID() => _prefs.getString("clientID");
  String? getAccountID() => _prefs.getString("accountID");
  String? getNetworkID() => _prefs.getString("networkID");
  String? getCommandID() => _prefs.getString("commandID");
  String? getProgramID() => _prefs.getString("programID");
  String? getCameraID() => _prefs.getString("cameraID");
  String? getJPEGName() => _prefs.getString("jpegName");

  void setClientID(String value) {
    _prefs.setString("clientID", value);
    notifyListeners();
  }

  void setAccountID(String value) {
    _prefs.setString("accountID", value);
    notifyListeners();
  }

  void setNetworkID(String value) {
    _prefs.setString("networkID", value);
    notifyListeners();
  }

  void setCommandID(String value) {
    _prefs.setString("commandID", value);
    notifyListeners();
  }

  void setProgramID(String value) {
    _prefs.setString("programID", value);
    notifyListeners();
  }

  void setCameraID(String value) {
    _prefs.setString("cameraID", value);
    notifyListeners();
  }

  void setJPEGName(String value) {
    _prefs.setString("jpegName", value);
    notifyListeners();
  }
}
