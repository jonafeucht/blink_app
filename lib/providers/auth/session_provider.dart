import 'package:flutter/foundation.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sessionProvider = ChangeNotifierProvider((ref) => SessionProvider());

class SessionProvider extends ChangeNotifier {
  SessionProvider();

  final sessionManager = SessionManager();

  dynamic getTier() => sessionManager.get("tier");
  dynamic getAccountId() => sessionManager.get("accountId");
  dynamic getClientId() => sessionManager.get("clientId");
  dynamic getToken() => sessionManager.get("token");

  dynamic destroySession() => sessionManager.destroy();

  void setTier(String value) {
    sessionManager.set("tier", value);
    notifyListeners();
  }

  void setAccountId(String value) {
    sessionManager.set("accountId", value);
    notifyListeners();
  }

  void setClientId(String value) {
    sessionManager.set("clientId", value);
    notifyListeners();
  }

  void setToken(String value) {
    sessionManager.set("token", value);
    notifyListeners();
  }
}
