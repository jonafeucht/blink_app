// import 'package:flutter/material.dart';
// import 'package:pinput/pinput.dart';

// class OnlyBottomCursor extends StatefulWidget {
//   const OnlyBottomCursor({super.key});

//   @override
//   _OnlyBottomCursorState createState() => _OnlyBottomCursorState();

//   @override
//   String toStringShort() => 'With Bottom Cursor';
// }

// class _OnlyBottomCursorState extends State<OnlyBottomCursor> {
//   final controller = TextEditingController();
//   final focusNode = FocusNode();

//   @override
//   void dispose() {
//     controller.dispose();
//     focusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     const borderColor = Color.fromRGBO(30, 60, 87, 1);

//     // final defaultPinTheme = PinTheme(
//     //   width: 56,
//     //   height: 56,
//     //   decoration: BoxDecoration(),
//     // );

//     final cursor = Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Container(
//           width: 56,
//           height: 3,
//           decoration: BoxDecoration(
//             color: borderColor,
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//       ],
//     );
//     final preFilledWidget = Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Container(
//           width: 56,
//           height: 3,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//       ],
//     );

//     return Pinput(
//       length: 6,
//       pinAnimationType: PinAnimationType.slide,
//       controller: controller,
//       focusNode: focusNode,
//       showCursor: true,
//       cursor: cursor,
//       preFilledWidget: preFilledWidget,
//     );
//   }
// }
