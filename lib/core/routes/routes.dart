import 'package:blinkapp/providers/auth/session_provider.dart';
import 'package:blinkapp/views/screens/auth/login_screen.dart';
import 'package:blinkapp/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BlinkAppRoute extends ConsumerWidget {
  const BlinkAppRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blink',
      theme: ThemeData(),
      home: FutureBuilder(
          future: ref.watch(sessionProvider).getToken(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator.adaptive();
            } else if (snapshot.hasData) {
              return const HomeScreen();
            } else {
              return const LoginScreen();
            }
          }),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}
