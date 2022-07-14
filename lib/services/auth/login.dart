import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends HookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  Future signIn(password, email) async {
    final client = http.Client();
    try {
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
      return response;
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      client.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController(text: "");
    final passwordController = useTextEditingController(text: "");

    useEffect(() {
      emailController.addListener(() {
        emailController.text.trim();
      });
      passwordController.addListener(() {
        passwordController.text.trim();
      });
    }, [
      emailController,
      passwordController,
    ]);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.only(
                right: 40,
                left: 40,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    "https://images.squarespace-cdn.com/content/v1/5e21c06a08d2fc435f20e6c5/64f527b9-86c8-447e-9759-04031ea53761/blink_logo_smile_blue.png",
                    color: Colors.black,
                    width: 120,
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blue.shade100,
                        child: IconButton(
                          color: Colors.black,
                          onPressed: () {
                            signIn(passwordController, emailController);
                          },
                          icon: const Icon(Icons.arrow_forward),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            //    Navigator.pushNamed(context, 'register');
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              color: Color(0xff4c505b),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              color: Color(0xff4c505b),
                            ),
                          ),
                        ),
                      ]),
                ],
              )),
        ),
      ),
    );
  }
}
