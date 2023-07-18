// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:gleekey_user/screens/sub_pages/appBarWithTitleAndBack.dart';
// import 'package:gleekey_user/utils/style/palette.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

// import 'package:flutter_spinkit/flutter_spinkit.dart';

// import '../../utils/style/constants.dart';

// class OtpScreen extends StatefulWidget {
//   const OtpScreen({Key? key}) : super(key: key);

//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }

// class _OtpScreenState extends State<OtpScreen> {
//   TextEditingController otpTextController = TextEditingController();

//   String currentText = "";
//   final formKey = GlobalKey<FormState>();
//   StreamController<ErrorAnimationType>? errorController;

//   @override
//   void initState() {
//     super.initState();

//     errorController = StreamController<ErrorAnimationType>();
//   }

//   @override
//   void dispose() {
//     errorController!.close();

//     super.dispose();
//   }

//   snackBar(String? message) {
//     return ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message!),
//         duration: const Duration(seconds: 2),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBarWithTitleAndBack(
//         title: "",
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(right: 30, left: 30),
//         child: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 margin: const EdgeInsets.only(right: 30),
//                 child: Text(
//                   'Enter 4 Digit  Verification  Code Sent  To Your Number',
//                   style: Palette.otpText1,
//                   textAlign: TextAlign.start,
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               otpScreen(),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 'resend code in 00:23',
//                 style: Palette.otpText14,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               otpBtn()
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget otpBtn() {
//     return MaterialButton(
//         shape: Palette.subCardShape,
//         color: kOrange,
//         child: SizedBox(
//           width: MediaQuery.of(context).size.width,
//           height: 50,
//           child: Center(
//             child: Text(
//               'Continue',
//               style: Palette.btnText,
//             ),
//           ),
//         ),
//         onPressed: () {});
//   }

//   Widget otpScreen() {
//     return Container(
//       margin: const EdgeInsets.only(right: 24),
//       child: PinCodeTextField(
//         length: 4,
//         obscureText: false,
//         animationType: AnimationType.fade,
//         cursorColor: kBlack,
//         cursorHeight: 15,
//         pinTheme: PinTheme(
//           shape: PinCodeFieldShape.box,
//           borderRadius: BorderRadius.circular(5),
//           fieldHeight: 50,
//           fieldWidth: 50,
//           activeFillColor: kLightGrey1.withOpacity(0.1),
//           inactiveColor: kLightGrey1.withOpacity(0.1),
//           inactiveFillColor: kLightGrey1.withOpacity(0.1),
//           activeColor: kLightGrey1.withOpacity(0.1),
//           selectedFillColor: kLightGrey1.withOpacity(0.1),
//           borderWidth: 0,
//           disabledColor: kLightGrey1.withOpacity(0.1),
//         ),
//         animationDuration: const Duration(milliseconds: 300),
//         // backgroundColor: Colors.blue.shade50,
//         enableActiveFill: true,
//         errorAnimationController: errorController,
//         textStyle: Palette.blackText16,
//         controller: otpTextController,

//         onCompleted: (v) {
//           print("Completed");
//         },
//         onChanged: (value) {
//           print(value);
//           setState(() {
//             currentText = value;
//           });
//         },
//         beforeTextPaste: (text) {
//           print("Allowing to paste $text");
//           //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
//           //but you can show anything you want here, like your pop up saying wrong paste format or etc
//           return true;
//         },
//         appContext: context,
//       ),
//     );
//   }
// }
