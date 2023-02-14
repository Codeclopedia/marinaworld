// ignore_for_file: use_build_context_synchronously

//import 'dart:math';

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/models.dart';
import '/controller/otp_timer.dart';
import '/controller/authproviders.dart';
import '/ui/screens/base_back_screen.dart';
import 'package:pinput/pinput.dart';

import '/core/constants.dart';
import '/core/state.dart';
import '/core/ui_core.dart';
import '../../widgets/top_image_screen.dart';

// final otpSentProvider =
//     StateProvider.family<bool, String>((ref, email) => false);
final otpPinProvider = StateProvider.family<String, String>((ref, email) => '');

// final timerStartedProvider = StateProvider.family<bool,String>((ref,id) => false);
final verifyOTPTimerProvider =
    StateNotifierProvider.family<TimerNotifier, TimerModel, String>(
  (_, phone) => TimerNotifier(),
);

class VerifyOtpScreen extends HookConsumerWidget {
  final String phone;

  const VerifyOtpScreen({Key? key, required this.phone}) : super(key: key);

  // _startLoading() {
  //   Future.delayed(const Duration());

  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // useEffect(() {
    //   return () {};
    // }, const []);

    // final value = ref.read(timerStartedProvider);
    // if (!value) {
    //   ref.read(verifyOTPTimerProvider.notifier).start();
    //   ref.read(timerStartedProvider.notifier).state = true;
    // }
    return BaseWilPopupScreen(
      onBack: () async {
        Navigator.pushReplacementNamed(context, RouteNames.login);
        return false;
      },
      child: Scaffold(
          body: TopImageScreen(
        onBack: () => Navigator.pushReplacementNamed(context, RouteNames.login),
        imageName: 'otp_bg.png',
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  S.current.verifyotp_greeting,
                  style: screenHeaderTitleStyle,
                ),
                SizedBox(height: 0.5.h),
                Text(
                  S.current.verifyotp_message,
                  style: captionTextStyle,
                ),
                SizedBox(height: 3.h),
                _buildOtpBox(),
                // Text(
                //   S.current.verifyotp_otp_caption,
                //   style: inputBoxCaptionStyle,
                // ),
                // SizedBox(height: 1.h),
                // _buildOtpBox(context, ref),
                // Row(
                //   mainAxisSize: MainAxisSize.max,
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     TextButton(
                //       style: textButtonStyle,
                //       onPressed: () {
                //         _resendOTP(ref, context);
                //       },
                //       child: Text(
                //         S.current.verifyotp_btx_resend_otp,
                //         style: textButtonTextStyle,
                //       ),
                //     ),
                //     // Text(
                //     //   S.current.verifyotp_txt_wait,
                //     //   style: normalTextStyle,
                //     // )
                //   ],
                // ),
                // SizedBox(
                //   height: 2.h,
                // ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: elevatedButtonTextStyle,
                      onPressed: () {
                        _verify(context, ref);
                      },
                      child: Text(
                        S.current.verifyotp_btn_submit,
                      )),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    style: textButtonStyle,
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, RouteNames.register);
                    },
                    child: Text(
                      S.current.verifyotp_back,
                      style: textButtonTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget _buildOtpBox() {
    return Consumer(
      builder: (context, ref, child) {
        final timerRunning = ref.watch(verifyOTPTimerProvider(phone)).running;
        final value = ref.watch(verifyOTPTimerProvider(phone));
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.current.verifyotp_otp_caption,
              style: inputBoxCaptionStyle,
            ),
            SizedBox(
              height: 1.h,
            ),
            Pinput(
              length: 6,
              errorText: S.current.verifyotp_error_invalid,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              // validator: (s) {
              //   return s == '222222' ? null : 'Pin is incorrect';
              // },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) =>
                  ref.read(otpPinProvider(phone).notifier).state = pin,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                timerRunning
                    ? Text(S.current.otp_login_txt_in_seconds(value.timeLeft))
                    : const SizedBox.shrink(),
                TextButton(
                  style: textButtonStyle,
                  onPressed: timerRunning
                      ? null
                      : () async {
                          _resendOTP(ref, context);
                        },
                  child: Text(
                    S.current.otp_login_btn_resend,
                    // style: textButtonTextStyle,
                  ),
                )
              ],
            )
          ],
        );
      },
    );
  }
  // _buildOtpBox(BuildContext context, WidgetRef ref) {
  //   return Pinput(
  //     length: 4,
  //     errorText: S.current.verifyotp_error_invalid,
  //     defaultPinTheme: defaultPinTheme,
  //     focusedPinTheme: focusedPinTheme,
  //     submittedPinTheme: submittedPinTheme,
  //     // validator: (s) {
  //     //   return s == '2222' ? null : S.current.verifyotp_error_invalid;
  //     // },
  //     pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
  //     showCursor: true,
  //     onCompleted: (pin) =>
  //         ref.read(otpPinProvider(email).notifier).state = pin,
  //   );
  // }

  _resendOTP(WidgetRef ref, BuildContext context) async {
    showLoading(ref);
    final error =
        await ref.read(authDataSourceProvider).resendRegisterOTP(phone);

    hideLoading(ref);
    if (error == null) {
      ref.watch(verifyOTPTimerProvider(phone).notifier).start();
      AppSnackbar.instance.message(context, S.current.msg_otp_sent);
    } else {
      AppSnackbar.instance.error(context, error);
    }
  }

  _verify(BuildContext context, WidgetRef ref) async {
    // EasyLoading.show();
    String smsCode = ref.read(otpPinProvider(phone).notifier).state;
    showLoading(ref);
    final error = await ref
        .read(authDataSourceProvider)
        .submitRegisterOTP(phone, smsCode);
    hideLoading(ref);
    if (error == null) {
      final pref = await SharedPreferences.getInstance();
      String? userStr = pref.getString('register_user');
      if (userStr?.isNotEmpty == true) {
        try {
          User.fromJson(jsonDecode(userStr!)); //Validate is valud model
          await pref.setString('user', userStr);
          await ref.read(authDataSourceProvider).init();
          pref.setString('register_user', '');
          Navigator.pushReplacementNamed(context, RouteNames.home);
          return;
        } catch (e) {
          debugPrint('Error $e');
        }
      }
      AppSnackbar.instance.message(context, 'OTP verified, Please login again');
      Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacementNamed(context, RouteNames.login);
    } else {
      AppSnackbar.instance.error(context, error);
    }
  }
}
