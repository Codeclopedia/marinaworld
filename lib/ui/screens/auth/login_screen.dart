// ignore_for_file: use_build_context_synchronously

import 'package:flutter/gestures.dart';

import '/controller/authproviders.dart';
import '/core/constants.dart';
import '/core/state.dart';
import '/core/ui_core.dart';
import '/core/utils.dart';
import '../../widgets/top_image_screen.dart';
import '../base_back_screen.dart';

final loginShowPasswordProvider = StateProvider<bool>(
  ((ref) => false),
);

final rememberMeProvider = StateProvider<bool>(
  ((ref) => ref.watch(authDataSourceProvider).keepLoggedIn),
);

class LoginScreen extends HookWidget {
  LoginScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // print('build called');
    final usernameTextController = useTextEditingController(text: '');
    final passwordTextController = useTextEditingController(text: '');
    // final authProvider = ref.watch(authDataSourceProvider);

    return BaseWilPopupScreen(
      onBack: () async {
        return true;
      },
      child: Scaffold(
        body: TopImageScreen(
          imageName: 'login_bg.png',
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
                      S.current.login_greetings,
                      style: screenHeaderTitleStyle,
                    ),
                    SizedBox(height: 0.5.h),
                    Text(
                      S.current.login_message,
                      style: captionTextStyle,
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      S.current.login_username_caption,
                      style: inputBoxCaptionStyle,
                    ),
                    SizedBox(height: 1.h),
                    TextFormField(
                      controller: usernameTextController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      validator: (value) {
                        if (value == null || value.isEmpty == true) {
                          return S.current.login_username_empty;
                        }
                        if (!isValidEmail(value)) {
                          return S.current.login_username_invalid;
                        }
                        return null;
                      },
                      decoration: inputDecorationStyle.copyWith(
                        hintText: S.current.login_username_hint,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      S.current.login_password_caption,
                      style: inputBoxCaptionStyle,
                    ),
                    SizedBox(height: 1.h),
                    Consumer(
                      builder: (context, ref, child) {
                        final showPassword = ref.watch(
                            loginShowPasswordProvider.select((value) => value));

                        return TextFormField(
                          controller: passwordTextController,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty == true) {
                              return S.current.login_password_empty;
                            }
                            if (value.length < 8) {
                              return S.current.login_password_invalid;
                            }
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            if (formKey.currentState?.validate() == true) {
                              _login(
                                  ref,
                                  context,
                                  usernameTextController.text.trim(),
                                  passwordTextController.text.trim());
                            }
                          },
                          obscureText: !showPassword,
                          decoration: inputDecorationStyle.copyWith(
                            hintText: S.current.login_password_hint,
                            suffixIcon: IconButton(
                              onPressed: (() => ref
                                  .read(loginShowPasswordProvider.notifier)
                                  .state = !showPassword),
                              icon: Icon(showPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                        );
                      },
                    ),
                    Consumer(
                      builder: (context, ref, child) {
                        final rememberMe = ref
                            .watch(rememberMeProvider.select((value) => value));
                        // print('Consumer build called:Remember');
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                ref.read(rememberMeProvider.notifier).state =
                                    !rememberMe;
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(
                                    value: rememberMe,
                                    checkColor: Colors.black,
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => Colors.transparent),
                                    side: MaterialStateBorderSide.resolveWith(
                                      (states) => const BorderSide(
                                          width: 1.0, color: Colors.grey),
                                    ),
                                    onChanged: (check) {
                                      ref
                                          .read(rememberMeProvider.notifier)
                                          .state = check ?? false;
                                    },
                                  ),
                                  Text(
                                    S.current.login_check_remember,
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontFamily: kFontFamily,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // Navigator.pushReplacementNamed(
                                //     context, RouteNames.verifyOtpForget,
                                //     arguments: 'email@gmail.com');
                                Navigator.pushReplacementNamed(
                                    context, RouteNames.forgetPassword);
                                // Navigator.pushReplacementNamed(
                                //     context, RouteNames.home);
                              },
                              child: Text(
                                S.current.login_btx_forgot_password_,
                                style: textButtonTextStyle.copyWith(
                                    color: AppColors.red, fontSize: 9.sp),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 2.h),
                    Consumer(
                      builder: (context, ref, child) {
                        //print('Consumer build called:authDataSource');
                        return SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: elevatedButtonTextStyle,
                              onPressed: () async {
                                if (formKey.currentState?.validate() == true) {
                                  _login(
                                      ref,
                                      context,
                                      usernameTextController.text,
                                      passwordTextController.text);
                                }
                                // _goHome(context);
                              },
                              child: Text(
                                S.current.login_btn_signin,
                              )),
                        );
                      },
                    ),
                    SizedBox(height: 1.h),
                    //
                    // Align(
                    //   alignment: Alignment.center,
                    //   child: TextButton(
                    //     style: textButtonStyle,
                    //     onPressed: () {
                    //       // Navigator.pushReplacementNamed(
                    //       //   context,
                    //       //   RouteNames.verifyOtp,
                    //       // );
                    //     },
                    //     child: Text(
                    //       S.current.login_btx_login_faceid,
                    //       style: textButtonTextStyle,
                    //     ),
                    //   ),
                    // ),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        style: textButtonStyle,
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            RouteNames.loginMobile,
                          );
                        },
                        child: Text(
                          S.current.login_btx_login_otp,
                          style: textButtonTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h),
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
                                    context,
                                    RouteNames.register,
                                  );
                                  // print('Tap Here onTap');
                                },
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        style: textButtonStyle,
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            RouteNames.home,
                          );
                        },
                        child: Text(
                          S.current.fp_btx_explore,
                          style: textButtonTextStyle,
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

  _login(WidgetRef ref, BuildContext context, String username,
      String password) async {
    showLoading(ref);
    final result = await ref
        .read(authDataSourceProvider)
        .signIn(username, password, ref.read(rememberMeProvider));
    hideLoading(ref);
    if (result == null) {
      Navigator.pushReplacementNamed(context, RouteNames.home);
    } else {
      AppSnackbar.instance.error(context, result);
    }
  }
}
