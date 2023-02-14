// ignore_for_file: use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:marina_mall/controller/authproviders.dart';

import '/core/constants.dart';
import '/core/state.dart';
import '/core/ui_core.dart';
import '/core/utils.dart';
import '../../widgets/top_image_screen.dart';
import '../base_back_screen.dart';
import 'verify_otp_screen.dart';

final selectedDateProvider = StateProvider<DateTime>(
  ((ref) => DateTime.now()),
);
final selectedGenderProvider = StateProvider<String>(
  ((ref) => S.current.signup_gender_hint),
);
// final selectedNationolityProvider = StateProvider<String>(
//   ((ref) => S.current.signup_nationality_hint),
// );

final signUpShowPasswordProvider = StateProvider<bool>(((ref) => false));
final genderOptions = [
  S.current.signup_gender_option_male,
  S.current.signup_gender_option_female,
  // S.current.signup_gender_option_other,
];

// ignore: must_be_immutable
class RegisterScreen extends HookConsumerWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context, WidgetRef ref) async {
    final now = DateTime.now();

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(now.year - 150),
        lastDate: now);
    if (picked != null && picked != _selectedDate) {
      _selectedDate = picked;
      ref.read(selectedDateProvider.notifier).state = _selectedDate;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameTextController = useTextEditingController(text: '');
    final usernameTextController = useTextEditingController(text: '');
    final passwordTextController = useTextEditingController(text: '');
    final mobileTextController = useTextEditingController(text: '');

    final selectedGender = ref.watch(selectedGenderProvider);
    // final selectedNationality = ref.watch(selectedNationolityProvider);
    final showPassword = ref.watch(signUpShowPasswordProvider);
    _selectedDate = ref.watch(selectedDateProvider);

    return BaseWilPopupScreen(
      onBack: () async {
        Navigator.pushReplacementNamed(context, RouteNames.login);
        return false;
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
                        S.current.signup_greetings,
                        style: screenHeaderTitleStyle,
                      ),
                      SizedBox(height: 0.5.h),
                      Text(
                        S.current.signup_message,
                        style: captionTextStyle,
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        S.current.signup_name_caption,
                        style: inputBoxCaptionStyle,
                      ),
                      SizedBox(height: 1.h),
                      TextFormField(
                        controller: nameTextController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.isEmpty == true) {
                            return S.current.contact_name_empty;
                          }
                          if (value.trim().length < 3) {
                            return S.current.contact_name_invalid;
                          }
                          return null;
                        },
                        decoration: inputDecorationStyle.copyWith(
                          hintText: S.current.contact_hint_name,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        S.current.signup_email_caption,
                        style: inputBoxCaptionStyle,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextFormField(
                        controller: usernameTextController,
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.isEmpty == true) {
                            return S.current.signup_email_empty;
                          }
                          if (!isValidEmail(value)) {
                            return S.current.signup_email_invalid;
                          }
                          return null;
                        },
                        decoration: inputDecorationStyle.copyWith(
                          hintText: S.current.signup_email_hint,
                        ),
                      ),
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
                                .read(signUpShowPasswordProvider.notifier)
                                .state = !showPassword),
                            icon: Icon(showPassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        S.current.signup_mobile_caption,
                        style: inputBoxCaptionStyle,
                      ),
                      SizedBox(height: 1.h),
                      TextFormField(
                        controller: mobileTextController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.phone,
                        maxLength: 8,
                        validator: (value) {
                          if (value == null || value.isEmpty == true) {
                            return S.current.signup_mobile_empty;
                          }
                          if (value.length < 8) {
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
                              '+965 ',
                              style: normalTextStyle.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // prefix: Text(
                          //   _countryCode,
                          //   style: normalTextStyle,
                          // ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              S.current.signup_gender_caption,
                              style: inputBoxCaptionStyle,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              S.current.signup_dob_caption,
                              style: inputBoxCaptionStyle,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 1.w),
                              decoration: const BoxDecoration(
                                color: AppColors.fillInputColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: DropdownButton<String>(
                                onTap: () {},
                                isExpanded: true,
                                underline: const SizedBox.shrink(),
                                items: genderOptions
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (v) {
                                  ref
                                          .read(selectedGenderProvider.notifier)
                                          .state =
                                      v ?? S.current.signup_gender_hint;
                                },
                                hint: Padding(
                                  padding: EdgeInsets.only(left: 2.w),
                                  child: Text(
                                    selectedGender,
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                    style: normalTextStyle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                _selectDate(context, ref);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4.w, vertical: 4.w),
                                // alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: AppColors.fillInputColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Text(
                                  dobFormat.format(_selectedDate),
                                  style: normalTextStyle,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      // Text(
                      //   S.current.signup_nationality_caption,
                      //   style: inputBoxCaptionStyle,
                      // ),
                      // SizedBox(
                      //   height: 1.h,
                      // ),
                      // Container(
                      //   width: double.infinity,
                      //   decoration: const BoxDecoration(
                      //     color: AppColors.fillInputColor,
                      //     borderRadius: BorderRadius.all(Radius.circular(10)),
                      //   ),
                      //   child: DropdownButton<String>(
                      //     onTap: () {},
                      //     underline: const SizedBox.shrink(),
                      //     items: countriesOptions
                      //         .map<DropdownMenuItem<String>>((String value) {
                      //       return DropdownMenuItem<String>(
                      //         value: value,
                      //         child: Text(value),
                      //       );
                      //     }).toList(),
                      //     onChanged: (v) {
                      //       ref
                      //           .read(selectedNationolityProvider.notifier)
                      //           .state = v ?? S.current.signup_nationality_hint;
                      //     },
                      //     hint: Container(
                      //       width: 75.w,
                      //       padding: EdgeInsets.only(left: 2.w),
                      //       child: Text(
                      //         selectedNationality,
                      //         style: normalTextStyle,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 3.h),
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
                                  .register(
                                      nameTextController.text.trim(),
                                      usernameTextController.text.trim(),
                                      passwordTextController.text.trim(),
                                      mobileTextController.text.trim(),
                                      ref.read(selectedGenderProvider),
                                      ref.read(selectedDateProvider));
                              // EasyLoading.dismiss();
                              hideLoading(ref);
                              if (error != null) {
                                AppSnackbar.instance.error(context, error);
                              } else {
                                String phone = mobileTextController.text.trim();
                                ref.invalidate(verifyOTPTimerProvider(phone));
                                ref
                                    .watch(
                                        verifyOTPTimerProvider(phone).notifier)
                                    .start();
                                Navigator.pushReplacementNamed(
                                    context, RouteNames.verifyOtp,
                                    arguments: phone);
                                // AppSnackbar.instance
                                //     .message(context, 'Success');
                              }
                            }
                          },
                          child: Text(
                            S.current.signup_btn_create_account,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 1.5.h,
                      ),

                      SizedBox(
                        height: 3.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: S.current.signup_footer_have_account,
                                  style: footerTextStyle),
                              TextSpan(
                                text: S.current.signup_btx_signin,
                                style: footerTextButtonStyle,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      RouteNames.login,
                                    );
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
            )),
      ),
    );
  }

  _register(BuildContext context, WidgetRef ref) async {
    EasyLoading.show();

    Future.delayed(const Duration(seconds: 3)).then((value) {
      EasyLoading.dismiss();
      Navigator.pushReplacementNamed(context, RouteNames.verifyOtp);
    });
  }
}
