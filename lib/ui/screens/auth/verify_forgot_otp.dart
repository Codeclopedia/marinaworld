// // ignore_for_file: use_build_context_synchronously

// //import 'dart:math';

// import '/controller/authproviders.dart';
// import '/ui/screens/base_back_screen.dart';
// import 'package:pinput/pinput.dart';

// import '/core/constants.dart';
// import '/core/state.dart';
// import '/core/ui_core.dart';
// import '../../widgets/top_image_screen.dart';

// // final forgototPinFProvider =
// //     StateProvider.family<String, String>((ref, email) => '');

// class VerifyForgotOtpScreen extends HookConsumerWidget {
//   final String email;
//   final _formkey = GlobalKey<FormState>();
//   VerifyForgotOtpScreen({Key? key, required this.email}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // String smsCode = ref.watch(forgototPinFProvider(email));
//     final pinController = useTextEditingController();

//     return BaseWilPopupScreen(
//       onBack: () async {
//         Navigator.pushReplacementNamed(context, RouteNames.login);
//         return true;
//       },
//       child: Scaffold(
//           body: TopImageScreen(
//         imageName: 'otp_bg.png',
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.all(8.w),
//             child: Form(
//               key: _formkey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Text(
//                     S.current.verifyotp_greeting,
//                     style: screenHeaderTitleStyle,
//                   ),
//                   SizedBox(height: 0.5.h),
//                   Text(
//                     S.current.verifyotp_message,
//                     style: captionTextStyle,
//                   ),
//                   SizedBox(height: 3.h),
//                   Text(
//                     S.current.verifyotp_otp_caption,
//                     style: inputBoxCaptionStyle,
//                   ),
//                   SizedBox(height: 1.h),
//                   _buildOtpBox(ref, pinController),
//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       TextButton(
//                         style: textButtonStyle,
//                         onPressed: () {
//                           _resendOTP(ref, context);
//                         },
//                         child: Text(
//                           S.current.verifyotp_btx_resend_otp,
//                           style: textButtonTextStyle,
//                         ),
//                       ),
//                       // Text(
//                       //   S.current.verifyotp_txt_wait,
//                       //   style: normalTextStyle,
//                       // )
//                     ],
//                   ),
//                   SizedBox(height: 2.h),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                         style: elevatedButtonTextStyle,
//                         onPressed: () {
//                           if (_formkey.currentState?.validate() == true &&
//                               pinController.text.trim().length != 4) {
//                             _verify(context, ref, pinController.text.trim());
//                           } else {
//                             AppSnackbar.instance.error(
//                                 context, S.current.verifyotp_error_invalid);
//                           }
//                         },
//                         child: Text(
//                           S.current.verifyotp_btn_submit,
//                         )),
//                   ),
//                   SizedBox(
//                     height: 1.5.h,
//                   ),
//                   Align(
//                     alignment: Alignment.center,
//                     child: TextButton(
//                       style: textButtonStyle,
//                       onPressed: () {
//                         Navigator.pushReplacementNamed(
//                             context, RouteNames.login);
//                       },
//                       child: Text(
//                         S.current.fp_btx_login_back,
//                         style: textButtonTextStyle,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       )),
//     );
//   }

//   Widget _buildOtpBox(WidgetRef ref, TextEditingController controller) {
//     return Pinput(
//       length: 4,
//       controller: controller,
//       errorText: S.current.verifyotp_error_invalid,
//       defaultPinTheme: defaultPinTheme,
//       focusedPinTheme: focusedPinTheme,
//       submittedPinTheme: submittedPinTheme,
//       validator: (s) {
//         return s!.length < 4 ? S.current.verifyotp_error_invalid : null;
//       },
//       pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
//       showCursor: true,
//       // onCompleted: (pin) =>
//       //     ref.read(forgototPinFProvider(email).notifier).state = pin,
//     );
//   }

//   _resendOTP(WidgetRef ref, BuildContext context) async {
//     showLoading(ref);
//     final error = await ref.read(authDataSourceProvider).forgotPassword(email);
//     hideLoading(ref);
//     if (error == null) {
//       AppSnackbar.instance
//           .message(context, 'OTP sent successfully, Please check your email');
//     } else {
//       AppSnackbar.instance.error(context, error);
//     }
//   }

//   _verify(BuildContext context, WidgetRef ref, String smsCode) async {
//     // EasyLoading.show();
//     // String smsCode = ref.read(forgototPinFProvider(email));
//     showLoading(ref);
//     final error =
//         await ref.read(authDataSourceProvider).verifyForgetOTP(email, smsCode);
//     hideLoading(ref);
//     if (error == null) {
//       Navigator.pushReplacementNamed(context, RouteNames.changePassword,
//           arguments: email);
//     } else {
//       AppSnackbar.instance.error(context, error);
//     }
//   }
// }
