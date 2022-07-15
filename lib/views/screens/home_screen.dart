import 'package:blinkapp/providers/auth/session_provider.dart';
import 'package:blinkapp/views/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountId = ref.watch(sessionProvider).getAccountId();
    final clientId = ref.watch(sessionProvider).getClientId();
    final tier = ref.watch(sessionProvider).getTier();
    final token = ref.watch(sessionProvider).getToken();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder(
                future: accountId,
                builder: ((context, snapshot) {
                  return Text("AccountID: ${snapshot.data}");
                })),
            FutureBuilder(
                future: clientId,
                builder: ((context, snapshot) {
                  return Text("ClientID: ${snapshot.data}");
                })),
            FutureBuilder(
                future: tier,
                builder: ((context, snapshot) {
                  return Text("Tier: ${snapshot.data}");
                })),
            FutureBuilder(
                future: token,
                builder: ((context, snapshot) {
                  return Text("Token: ${snapshot.data}");
                })),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
                await ref.read(sessionProvider).destroySession();
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
