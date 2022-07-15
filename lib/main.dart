import 'package:blinkapp/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// provider stores the instance SharedPreferences
final sharedPreferencesProvider = Provider<SharedPreferences>((_) {
  return throw UnimplementedError();
});
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const BlinkAppRoute(),
    ),
  );
}
