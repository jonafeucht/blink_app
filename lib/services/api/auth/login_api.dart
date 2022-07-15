import 'package:blinkapp/core/consts.dart';
import 'package:blinkapp/models/auth/login_model.dart';
import 'package:blinkapp/providers/auth/login_provider.dart';
import 'package:blinkapp/views/screens/auth/verify_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginApi {
  final Reader ref;
  LoginApi(this.ref);

  Future signIn(password, email, context) async {
    final client = http.Client();
    try {
      ref(isLoadingProvider).setIsLoading(true);
      var url = Uri.parse(prodUrl);
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
      print(LoginModel.fromJson(json.decode(response.body)).account!.accountId);
      print(LoginModel.fromJson(json.decode(response.body)).account!.userId);
      print(LoginModel.fromJson(json.decode(response.body)).account!.clientId);
      print(LoginModel.fromJson(json.decode(response.body)).account!.tier);
      print(LoginModel.fromJson(json.decode(response.body)).account!.region);
      print(LoginModel.fromJson(json.decode(response.body)).auth!.token);

      switch (response.statusCode) {
        case 200:
          var accountID = LoginModel.fromJson(json.decode(response.body))
              .account!
              .accountId;
          var userID =
              LoginModel.fromJson(json.decode(response.body)).account!.userId;
          var clientID =
              LoginModel.fromJson(json.decode(response.body)).account!.clientId;
          var region =
              LoginModel.fromJson(json.decode(response.body)).account!.region;
          var tier =
              LoginModel.fromJson(json.decode(response.body)).account!.tier;
          var authToken =
              LoginModel.fromJson(json.decode(response.body)).auth!.token;

          // Temporary Navigation!
          // TODO: BETTER ROUTING
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VerifyScreen(
                      tier: tier!,
                      accountID: accountID.toString(),
                      clientID: clientID.toString(),
                      authToken: authToken!,
                    )),
          );

          // TODO: PASS AUTHTOKEN TO SESSION

          // Navigator.pushNamed(context, '/verify', arguments: {
          //   "tier": tier,
          //   "accountID": accountID,
          //   "clientID": clientID,
          //   "authToken": authToken,
          // });
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
