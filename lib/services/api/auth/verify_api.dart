import 'dart:convert';

import 'package:blinkapp/core/consts.dart';
import 'package:blinkapp/providers/auth/login_provider.dart';
import 'package:blinkapp/providers/auth/session_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

class VerifyApi {
  final Reader ref;
  VerifyApi(this.ref);

  Future verify(tier, accountId, clientId, authToken, pin, context) async {
    ref(isLoadingProvider).setIsLoading(true);
    final client = http.Client();
    try {
      var url = Uri.parse(getVerifyUrl(tier, accountId, clientId));
      var response = await client.post(
        url,
        headers: {
          "content-type": "application/json",
          "token-auth": authToken,
        },
        body: json.encode(
          {
            "pin": pin,
          },
        ),
      );

      switch (response.statusCode) {
        case 200:
          debugPrint("OK");
          ref(sessionProvider).setTier(tier);
          ref(sessionProvider).setAccountId(accountId);
          ref(sessionProvider).setClientId(clientId);
          ref(sessionProvider).setToken(authToken);
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (context) => const HomeScreen()),
          // );
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
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
