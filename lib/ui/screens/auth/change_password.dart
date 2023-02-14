// ignore_for_file: use_build_context_synchronously

import '/controller/authproviders.dart';
import '/core/constants.dart';
import '/core/state.dart';
import '/core/ui_core.dart';
import '../../widgets/top_image_screen.dart';
import '../base_back_screen.dart';

final changePswShowPasswordProvider = StateProvider<bool>(((ref) => false));
final changeCnfPswShowPasswordProvider = StateProvider<bool>(((ref) => false));

class ChangePasswordScreen extends HookConsumerWidget {
  final String phone;

  ChangePasswordScreen({Key? key, required this.phone}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final usernameTextController = useTextEditingController(text: '');
    final passwordTextController = useTextEditingController(text: '');
    final confirmPassTextController = useTextEditingController(text: '');
    final showPassword = ref.watch(changePswShowPasswordProvider);
    final showCnfPassword = ref.watch(changeCnfPswShowPasswordProvider);

    return BaseWilPopupScreen(
      onBack: () async {
        Navigator.pushReplacementNamed(context, RouteNames.login);
        return true;
      },
      child: Scaffold(
        body: TopImageScreen(
            onBack: () =>
                Navigator.pushReplacementNamed(context, RouteNames.login),
            imageName: 'signup_bg.png',
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
                        S.current.change_pass_title,
                        style: screenHeaderTitleStyle,
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      RichText(
                        text: TextSpan(
                            text: S.current.change_pass_caption,
                            style: captionTextStyle,
                            children: [
                              TextSpan(
                                  text: phone,
                                  style: captionTextStyle.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ]),
                      ),
                      // Text(
                      //   S.current.change_pass_caption(email),
                      //   style: captionTextStyle,
                      // ),
                      SizedBox(
                        height: 3.h,
                      ),
                      // Text(
                      //   S.current.signup_email_caption,
                      //   style: inputBoxCaptionStyle(context),
                      // ),
                      // SizedBox(
                      //   height: 1.h,
                      // ),
                      // TextFormField(
                      //   // controller: usernameTextController,
                      //   enabled: false,
                      //   initialValue: email,
                      //   keyboardType: TextInputType.emailAddress,
                      //   autocorrect: false,
                      //   textInputAction: TextInputAction.next,
                      //   // validator: (value) {
                      //   //   if (value == null || value.isEmpty == true) {
                      //   //     return S.current.signup_email_empty;
                      //   //   }
                      //   //   if (!isValidEmail(value)) {
                      //   //     return S.current.signup_email_invalid;
                      //   //   }
                      //   //   return null;
                      //   // },
                      //   decoration: inputDirectionStyle.copyWith(
                      //     hintText: S.current.signup_email_hint,
                      //   ),
                      // ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        S.current.signup_password_caption,
                        style: inputBoxCaptionStyle,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextFormField(
                        controller: passwordTextController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value == null || value.isEmpty == true) {
                            return S.current.signup_password_empty;
                          }
                          if (value.length < 8) {
                            return S.current.signup_password_invalid;
                          }
                          return null;
                        },
                        obscureText: !showPassword,
                        decoration: inputDecorationStyle.copyWith(
                          hintText: S.current.signup_password_hint,
                          suffixIcon: IconButton(
                            onPressed: (() => ref
                                .read(changePswShowPasswordProvider.notifier)
                                .state = !showPassword),
                            icon: Icon(showPassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        S.current.signup_cnf_password_caption,
                        style: inputBoxCaptionStyle,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextFormField(
                        controller: confirmPassTextController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value == null || value.isEmpty == true) {
                            return S.current.signup_cnf_password_empty;
                          }
                          if (value.length < 8) {
                            return S.current.signup_cnf_password_invalid;
                          }
                          if (passwordTextController.text.trim() != value) {
                            return S.current.signup_cnf_password_invalid;
                          }
                          return null;
                        },
                        obscureText: !showCnfPassword,
                        decoration: inputDecorationStyle.copyWith(
                          hintText: S.current.signup_cnf_password_hint,
                          suffixIcon: IconButton(
                            onPressed: (() => ref
                                .read(changeCnfPswShowPasswordProvider.notifier)
                                .state = !showCnfPassword),
                            icon: Icon(showCnfPassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 3.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: elevatedButtonTextStyle,
                          onPressed: () async {
                            if (formKey.currentState?.validate() == true) {
                              // EasyLoading.show();
                              showLoading(ref);
                              final error = await ref
                                  .read(authDataSourceProvider)
                                  .changePassword(
                                    phone,
                                    // usernameTextController.text.trim(),
                                    passwordTextController.text.trim(),
                                    confirmPassTextController.text.trim(),
                                  );
                              // EasyLoading.dismiss();
                              hideLoading(ref);
                              if (error != null) {
                                AppSnackbar.instance.error(context, error);
                              } else {
                                AppSnackbar.instance.message(context,
                                    'Password changed successfully, Please login with new password');
                                await Future.delayed(
                                    const Duration(seconds: 2));
                                Navigator.pushReplacementNamed(
                                    context, RouteNames.login);
                              }
                            }
                          },
                          child: Text(
                            S.current.fp_btn_submit,
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
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
                      // Align(
                      //   alignment: Alignment.center,
                      //   child: RichText(
                      //     text: TextSpan(
                      //       children: [
                      //         TextSpan(
                      //             text: S.current.signup_footer_have_account,
                      //             style: footerTextStyle),
                      //         TextSpan(
                      //           text: S.current.signup_btx_signin,
                      //           style: footerTextButtonStyle,
                      //           recognizer: TapGestureRecognizer()
                      //             ..onTap = () {
                      //               Navigator.pushReplacementNamed(
                      //                 context,
                      //                 RouteNames.login,
                      //               );
                      //               // print('Tap Here onTap');
                      //             },
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 2.h),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
