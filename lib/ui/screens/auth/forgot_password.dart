// ignore_for_file: use_build_context_synchronously

import 'package:pinput/pinput.dart';

import '/controller/authproviders.dart';
// import '/core/utils.dart';
// import '/ui/screens/base_back_screen.dart';
import '/controller/otp_timer.dart';
import '/ui/screens/base_back_screen.dart';
import '/core/state.dart';
import '/core/constants.dart';
import '/core/ui_core.dart';
import '../../widgets/top_image_screen.dart';

final fpEnteredOTPProvider = StateProvider.autoDispose<String>(
  (_) => '',
);

final fpOtpGeneratedProvider = StateProvider.autoDispose<bool>(
  (_) => false,
);

//OTP timer
final fpTimerProvider =
    StateNotifierProvider.autoDispose<TimerNotifier, TimerModel>(
  (_) => TimerNotifier(),
);

class ForgotPasswordScreen extends HookConsumerWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mobileTextController = useTextEditingController(text: '');
    final enteredOTP = ref.watch(fpEnteredOTPProvider);

    return BaseWilPopupScreen(
      onBack: () async {
        Navigator.pushReplacementNamed(context, RouteNames.login);
        return false;
      },
      child: Scaffold(
        body: TopImageScreen(
          onBack: () =>
                Navigator.pushReplacementNamed(context, RouteNames.login),
          imageName: 'home_bg.png',
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // SizedBox(
                    //   height: 7.h,
                    // ),
                    Text(
                      S.current.fp_header_title,
                      style: screenHeaderTitleStyle,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      S.current.fp_desc_mobile_message,
                      style: captionTextStyle,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      S.current.otp_login_mobile_caption,
                      style: inputBoxCaptionStyle,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Consumer(builder: (context, ref, child) {
                      final isOtpSent = ref.watch(fpOtpGeneratedProvider);
                      return TextFormField(
                        controller: mobileTextController,
                        keyboardType: TextInputType.phone,
                        maxLength: 8,
                        enabled: !isOtpSent,
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if (value == null || value.isEmpty == true) {
                            return S.current.signup_mobile_empty;
                          }
                          if (value.trim().length != 8) {
                            return S.current.signup_mobile_invalid;
                          }
                          return null;
                        },
                        decoration: inputDecorationStyle.copyWith(
                          hintText: S.current.signup_mobile_hint,
                          prefixIcon: Container(
                            alignment: Alignment.centerLeft,
                            width: 14.w,
                            padding: EdgeInsets.only(left: 2.w),
                            child: Text(
                              '+965',
                              style: normalTextStyle.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),

                    SizedBox(height: 1.h),
                    _buildOtpBox(mobileTextController),
                    SizedBox(height: 2.h),
                    SizedBox(
                      width: double.infinity,
                      child: Consumer(builder: (context, ref, child) {
                        final isOtpSent = ref.watch(fpOtpGeneratedProvider);
                        return ElevatedButton(
                            style: elevatedButtonTextStyle,
                            onPressed: () async {
                              if (!isOtpSent &&
                                  formKey.currentState?.validate() == true) {
                                EasyLoading.show();
                                final result = await ref
                                    .read(authDataSourceProvider)
                                    .forgotPassword(
                                        mobileTextController.text.trim());
                                EasyLoading.dismiss();
                                if (result != null) {
                                  AppSnackbar.instance.error(context, result);
                                } else {
                                  AppSnackbar.instance
                                      .message(context, S.current.msg_otp_sent);
                                  ref
                                      .read(fpOtpGeneratedProvider.notifier)
                                      .state = true;
                                  ref.read(fpTimerProvider.notifier).start();
                                }
                              } else {
                                if (formKey.currentState?.validate() == true) {
                                  if (enteredOTP.isEmpty) {
                                    AppSnackbar.instance.error(context,
                                        S.current.verifyotp_error_invalid);
                                    return;
                                  }
                                  EasyLoading.show();
                                  final result = await ref
                                      .read(authDataSourceProvider)
                                      .verifyForgetOTP(
                                          mobileTextController.text.trim(),
                                          enteredOTP);
                                  EasyLoading.dismiss();
                                  if (result != null) {
                                    AppSnackbar.instance.error(context, result);
                                  } else {
                                    Navigator.pushReplacementNamed(
                                        context, RouteNames.changePassword,
                                        arguments:
                                            mobileTextController.text.trim());
                                  }
                                }
                              }
                            },
                            child: Text(
                              isOtpSent
                                  ? S.current.otp_login_btn_verify
                                  : S.current.otp_login_btn_send,
                            ));
                      }),
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
                          S.current.fp_btx_login_back,
                          style: textButtonTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOtpBox(TextEditingController mobileController) {
    return Consumer(
      builder: (context, ref, child) {
        final timerRunning = ref.watch(fpTimerProvider).running;
        final otpSent = ref.watch(fpOtpGeneratedProvider);
        final value = ref.watch(fpTimerProvider);
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
                    onCompleted: (pin) =>
                        ref.read(fpEnteredOTPProvider.notifier).state = pin,
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
                                      .forgotPassword(mobileController.text);
                                  EasyLoading.dismiss();
                                  if (result != null) {
                                    AppSnackbar.instance.error(context, result);
                                  } else {
                                    AppSnackbar.instance.message(
                                        context, S.current.msg_otp_sent);
                                    ref
                                        .read(fpOtpGeneratedProvider.notifier)
                                        .state = true;
                                    ref.read(fpTimerProvider.notifier).start();
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
