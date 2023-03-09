// ignore_for_file: use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:marina_mall/controller/dataproviders.dart';

import 'package:pinput/pinput.dart';
import '/controller/otp_timer.dart';
import '/controller/authproviders.dart';
import '/core/constants.dart';
import '/core/state.dart';
import '/core/ui_core.dart';
import '../../widgets/top_image_screen.dart';
import '../base_back_screen.dart';

final loginEnteredOTPProvider = StateProvider.autoDispose<String>(
  (_) => '',
);

final loginOtpGeneratedProvider = StateProvider.autoDispose<bool>(
  (_) => false,
);

//OTP timer
final loginTimerProvider =
    StateNotifierProvider.autoDispose<TimerNotifier, TimerModel>(
  (_) => TimerNotifier(),
);

class LoginMobileScreen extends HookConsumerWidget {
  LoginMobileScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      // ref.invalidate(loginOtpGeneratedProvider);
      return () {};
    }, const []);
    // print('build called');
    final mobileTextController = useTextEditingController(text: '');
    final isOtpSent = ref.watch(loginOtpGeneratedProvider);
    final enteredOTP = ref.watch(loginEnteredOTPProvider);
    final bool isArabic = ref.watch(languageStateProvider) == langArabic;

    // final authProvider = ref.watch(authDataSourceProvider);
    return BaseWilPopupScreen(
      onBack: () async {
        Navigator.pushReplacementNamed(context, RouteNames.login);
        return false;
      },
      child: Scaffold(
        body: TopImageScreen(
          onBack: () =>
              Navigator.pushReplacementNamed(context, RouteNames.login),
          imageName: 'otp_bg.png',
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      S.current.otp_login_header_title,
                      style: screenHeaderTitleStyle,
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      S.current.otp_login_mobile_caption,
                      style: inputBoxCaptionStyle,
                    ),
                    SizedBox(height: 1.h),
                    TextFormField(
                      controller: mobileTextController,
                      keyboardType: TextInputType.phone,
                      maxLength: 8,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.current.signup_mobile_empty;
                        }
                        if (value.length != 8) {
                          return S.current.signup_mobile_invalid;
                        }
                        return null;
                      },
                      decoration: inputDecorationStyle.copyWith(
                        enabled: !isOtpSent,
                        hintText: S.current.signup_mobile_hint,
                        prefixIcon: Container(
                          alignment: Alignment.centerLeft,
                          width: 14.w,
                          padding: EdgeInsets.only(left: 2.w),
                          child: Text(
                            '+965 ',
                            textDirection: TextDirection.ltr,
                            style: normalTextStyle.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      //     );
                      //   },
                    ),
                    SizedBox(height: 2.w),
                    _buildOtpBox(mobileTextController),
                    SizedBox(height: 2.h),
                    // Consumer(
                    //   builder: (context, ref, child) {
                    //     final isOtpSent = ref.watch(loginOtpGeneratedProvider);
                    //     return
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: elevatedButtonTextStyle,
                        onPressed: () async {
                          if (!isOtpSent &&
                              formKey.currentState?.validate() == true) {
                            EasyLoading.show();
                            final result = await ref
                                .read(authDataSourceProvider)
                                .signInMobile(mobileTextController.text, true);
                            EasyLoading.dismiss();
                            if (result != null) {
                              AppSnackbar.instance.error(context, result);
                            } else {
                              AppSnackbar.instance
                                  .message(context, S.current.msg_otp_sent);
                              ref
                                  .read(loginOtpGeneratedProvider.notifier)
                                  .state = true;
                              ref.read(loginTimerProvider.notifier).start();
                            }
                          } else {
                            if (formKey.currentState?.validate() == true) {
                              print('entered OTP $enteredOTP');

                              if (enteredOTP.isEmpty) {
                                AppSnackbar.instance.error(
                                    context, S.current.verifyotp_error_invalid);
                                return;
                              }
                              EasyLoading.show();
                              final result = await ref
                                  .read(authDataSourceProvider)
                                  .verifyMobileOtp(
                                      mobileTextController.text, enteredOTP);
                              EasyLoading.dismiss();
                              if (result != null) {
                                AppSnackbar.instance.error(context, result);
                              } else {
                                Navigator.pushReplacementNamed(
                                    context, RouteNames.home);
                              }
                            }
                          }
                          // ref.read(loginRepositoryProvider).
                        },
                        child: Text(
                          isOtpSent
                              ? S.current.otp_login_btn_verify
                              : S.current.otp_login_btn_send,
                        ),
                      ),
                      //   );
                      // },
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
                              context, RouteNames.login);
                        },
                        child: Text(
                          S.current.login_btx_login_password,
                          style: textButtonTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.w,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: S.current.login_footer_no_account,
                                style: footerTextStyle),
                            TextSpan(
                              text: S.current.login_btx_signup,
                              style: footerTextButtonStyle,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacementNamed(
                                      context, RouteNames.register);
                                  // print('Tap Here onTap');
                                },
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // _login(WidgetRef ref, BuildContext context, String username,
  //     String password) async {
  //   showLoading(ref);
  //   final result = await ref
  //       .read(authDataSourceProvider)
  //       .signIn(username, password, ref.read(rememberMeProvider));
  //   hideLoading(ref);
  //   if (result == null) {
  //     Navigator.pushReplacementNamed(context, RouteNames.home);
  //   } else {
  //     AppSnackbar.instance.error(context, result);
  //   }
  // }

  Widget _buildOtpBox(TextEditingController mobileController) {
    return Consumer(
      builder: (context, ref, child) {
        final timerRunning = ref.watch(loginTimerProvider).running;
        final otpSent = ref.watch(loginOtpGeneratedProvider);
        final value = ref.watch(loginTimerProvider);
        return otpSent
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.current.otp_login_otp_caption,
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
                    onCompleted: (pin) {
                      print('Completed $pin');
                      ref.read(loginEnteredOTPProvider.notifier).state = pin;
                      print(
                          'Completed post ${ref.read(loginEnteredOTPProvider)}');
                    },
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      timerRunning
                          ? Text(S.current
                              .otp_login_txt_in_seconds(value.timeLeft))
                          : const SizedBox.shrink(),
                      TextButton(
                        style: textButtonStyle,
                        onPressed: timerRunning
                            ? null
                            : () async {
                                if (formKey.currentState?.validate() == true) {
                                  EasyLoading.show();
                                  final result = await ref
                                      .read(authDataSourceProvider)
                                      .signInMobile(
                                          mobileController.text, true);
                                  EasyLoading.dismiss();
                                  if (result != null) {
                                    AppSnackbar.instance.error(context, result);
                                  } else {
                                    AppSnackbar.instance.message(
                                        context, S.current.msg_otp_sent);
                                    ref
                                        .read(
                                            loginOtpGeneratedProvider.notifier)
                                        .state = true;
                                    ref
                                        .read(loginTimerProvider.notifier)
                                        .start();
                                  }
                                }
                              },
                        child: Text(
                          S.current.otp_login_btn_resend,
                          // style: textButtonTextStyle,
                        ),
                      )
                    ],
                  )
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }
}
