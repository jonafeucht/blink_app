import 'package:blinkapp/provider/auth/login_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginApi {
  final Reader ref;
  LoginApi(this.ref);

  Future signIn(password, email) async {
    final client = http.Client();
    try {
      ref(isLoadingProvider).setIsLoading(true);
      var url =
          Uri.parse("https://rest-prod.immedia-semi.com/api/v5/account/login");
      var response = await client.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(
          {
            "password": password.text.trim(),
            "email": email.text.trim(),
          },
        ),
      );
      debugPrint(response.body);

      switch (response.statusCode) {
        case 200:
          debugPrint("Hello!");
          ref(isLoadingProvider).setIsLoading(false);
          break;
        default:
          debugPrint("Not authorized!");
          ref(isLoadingProvider).setIsLoading(false);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      client.close();
    }
  }
}
