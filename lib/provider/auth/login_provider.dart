import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final isLoadingProvider = ChangeNotifierProvider((ref) => LoginProvider());

class LoginProvider extends ChangeNotifier {
  LoginProvider({this.isLoading = false});
  bool isLoading;

  void setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
