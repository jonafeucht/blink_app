import 'package:blinkapp/providers/auth/login_provider.dart';
import 'package:blinkapp/services/api/auth/verify_api.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pinput/pinput.dart';

class VerifyScreen extends HookConsumerWidget {
  const VerifyScreen({
    Key? key,
    required this.tier,
    required this.accountID,
    required this.clientID,
    required this.authToken,
  }) : super(key: key);

  final String tier;
  final String accountID;
  final String clientID;
  final String authToken;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final verifyApi = useMemoized((() => VerifyApi(ref.read)), []);
    final isLoading = ref.watch(isLoadingProvider).isLoading;

    const borderColor = Color.fromRGBO(30, 60, 87, 1);

    final pinController = useTextEditingController(text: "");
    final focusNode = useFocusNode();

    // final args = ModalRoute.of(context)!.settings.arguments as VerifyArguments;

    // print(args.region);
    // print(args.accountID);
    // print(args.clientID);
    // print(args.authToken);

    final cursor = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: borderColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
    final preFilledWidget = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: !isLoading
            ? Pinput(
                length: 6,
                pinAnimationType: PinAnimationType.slide,
                controller: pinController,
                focusNode: focusNode,
                showCursor: true,
                cursor: cursor,
                preFilledWidget: preFilledWidget,
                onCompleted: (value) {
                  verifyApi.verify(
                    tier,
                    accountID,
                    clientID,
                    authToken,
                    value,
                    context,
                  );
                },
              )
            : const CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
