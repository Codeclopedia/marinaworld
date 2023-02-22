// ignore_for_file: use_build_context_synchronously

import 'package:date_field/date_field.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:marina_mall/controller/authproviders.dart';
import 'package:marina_mall/controller/dataproviders.dart';
import 'package:marina_mall/data/models/response/country_data_response.dart';

import '/core/constants.dart';
import '/core/state.dart';
import '/core/ui_core.dart';
import '/core/utils.dart';
import '../../widgets/top_image_screen.dart';
import '../base_back_screen.dart';
import 'verify_otp_screen.dart';

final selectedDateProvider = StateProvider.autoDispose<DateTime>(
  ((ref) => DateTime.now()),
);
final selectedGenderProvider = StateProvider.autoDispose<String?>(
  ((ref) => null),
);
final selectedNationolityProvider = StateProvider<String?>(
  ((ref) => null
  // S.current.signup_nationality_hint
  ),
);

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
  List<Countries> countriesData = [];

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
    final searchTextController = useTextEditingController(text: '');

    final selectedGender = ref.watch(selectedGenderProvider);
    final selectedNationality = ref.watch(selectedNationolityProvider);
    final showPassword = ref.watch(signUpShowPasswordProvider);
    final isArabic = ref.watch(languageStateProvider) == langArabic;
    _selectedDate = ref.watch(selectedDateProvider);
    ref.watch(countriesDataProvider).whenData((value) {
      countriesData =
          value ?? [Countries(name: "Kuwait", nameAr: "الكويت", code: "KW")];
    });
    // useEffect(
    //   () {
    //     return (() {
    //       nameTextController.dispose();
    //       usernameTextController.dispose();
    //       passwordTextController.dispose();
    //       mobileTextController.dispose();
    //       searchTextController.dispose();
    //     });
    //   },
    // );

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
                              isArabic ? '965+' : '+965 ',
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
                          // Expanded(
                          //   flex: 1,
                          //   child: DropdownButtonHideUnderline(
                          //     child: DropdownButton2(
                          //       isExpanded: true,
                          //       hint: Expanded(
                          //         child: Text(
                          //           S.current.signup_gender_hint,
                          //           style: TextStyle(
                          //             fontSize: 9.5.sp,
                          //             fontWeight: FontWeight.bold,
                          //             color: AppColors.hintTextColor,
                          //           ),
                          //           overflow: TextOverflow.ellipsis,
                          //         ),
                          //       ),
                          //       items: genderOptions
                          //           .map((item) => DropdownMenuItem<String>(
                          //                 value: item,
                          //                 child: Text(
                          //                   item,
                          //                   style: TextStyle(
                          //                     fontSize: 11.sp,
                          //                     fontWeight: FontWeight.bold,
                          //                     color: Colors.black,
                          //                   ),
                          //                   overflow: TextOverflow.ellipsis,
                          //                 ),
                          //               ))
                          //           .toList(),
                          //       value: selectedGender,

                          //       onChanged: (v) {
                          //         ref
                          //             .read(selectedGenderProvider.notifier)
                          //             .state = v.toString();
                          //       },
                          //       icon: const Icon(
                          //         Icons.arrow_drop_down,
                          //       ),

                          //       iconSize: 5.w,
                          //       iconEnabledColor: Colors.black,
                          //       iconDisabledColor: Colors.grey,
                          //       buttonHeight: 10.w,
                          //       buttonWidth: 30.w,
                          //       buttonPadding:
                          //           EdgeInsets.only(left: 2.w, right: 2.w),
                          //       buttonDecoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(2.5.w),
                          //         // border: Border.all(
                          //         //   color: Colors.black26,
                          //         // ),
                          //         color: AppColors.fillInputColor,
                          //       ),
                          //       buttonElevation: 0,
                          //       // itemHeight: 10.w,
                          //       itemPadding:
                          //           const EdgeInsets.only(left: 14, right: 14),
                          //       // dropdownMaxHeight: 200,
                          //       // dropdownWidth: 13.w,

                          //       dropdownPadding: null,
                          //       dropdownDecoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(14),
                          //         color: AppColors.white,
                          //       ),
                          //       dropdownElevation: 1,
                          //       scrollbarRadius: const Radius.circular(40),
                          //       // scrollbarThickness: 6,
                          //       scrollbarAlwaysShow: true,
                          //       offset: const Offset(-20, 0),
                          //     ),
                          //   ),
                          // ),
                          Expanded(
                            flex: 1,
                            child: DropdownButtonFormField2(
                              // buttonDecoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(14),
                              //   border: Border.all(
                              //     color: Colors.black26,
                              //   ),
                              //   color: AppColors.fillInputColor,
                              // ),

                              decoration: inputDecorationStyle.copyWith(
                                //Add isDense true and zero Padding.
                                //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                                isDense: true,

                                // border: InputBorder.none,

                                contentPadding: EdgeInsets.zero,
                                fillColor: AppColors.fillInputColor,

                                // border: OutlineInputBorder(
                                //   borderRadius: BorderRadius.circular(3.w),
                                // ),
                                //Add more decoration as you want here
                                //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                              ),

                              // isExpanded: true,
                              hint: Text(
                                S.current.signup_gender_hint,
                                maxLines: 1,
                                style: TextStyle(fontSize: 9.5.sp),
                              ),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 5.w,
                              buttonHeight: 13.w,

                              dropdownPadding: EdgeInsets.zero,
                              buttonPadding: EdgeInsets.zero,

                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.w),
                              ),
                              items: genderOptions
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              validator: (value) {
                                if (value == null) {
                                  return S.current.signup_gender_hint;
                                }
                              },
                              onChanged: (v) {
                                ref
                                    .read(selectedGenderProvider.notifier)
                                    .state = v ?? S.current.signup_gender_hint;
                              },
                              // onSaved: (value) {
                              //   selectedValue = value.toString();
                              // },
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Expanded(
                            flex: 1,
                            child: DateTimeFormField(
                              decoration: inputDecorationStyle.copyWith(
                                hintMaxLines: 1,
                                helperMaxLines: 1,
                                errorMaxLines: 1,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 2.w),
                                hintText: S.current.DOB_hint_text,
                                hintStyle: TextStyle(
                                    color: Colors.black45, fontSize: 10.sp),
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 12.sp),
                                fillColor: AppColors.fillInputColor,
                                suffixIcon: const Icon(Icons.event_note),
                              ),
                              mode: DateTimeFieldPickerMode.date,
                              dateFormat: dobFormat,
                              autovalidateMode: AutovalidateMode.disabled,
                              validator: (e) =>
                                  e == null || e.day == DateTime.now().day
                                      ? S.current.DOB_empty_error
                                      : null,
                              onDateSelected: (DateTime picked) {
                                _selectedDate = picked;
                                ref.read(selectedDateProvider.notifier).state =
                                    _selectedDate;
                              },
                            ),
                          ),
                          // Expanded(
                          //   flex: 1,
                          //   child: InkWell(
                          //     onTap: () {
                          // _selectDate(context, ref);
                          //     },
                          //     child: Container(
                          //       width: double.infinity,
                          //       padding: EdgeInsets.symmetric(
                          //           horizontal: 4.w, vertical: 4.w),
                          //       // alignment: Alignment.center,
                          //       decoration: const BoxDecoration(
                          //         color: AppColors.fillInputColor,
                          //         borderRadius:
                          //             BorderRadius.all(Radius.circular(10)),
                          //       ),
                          //       child: Text(
                          //         dobFormat.format(_selectedDate),
                          //         style: normalTextStyle.copyWith(
                          //             fontWeight: FontWeight.w500,
                          //             color: Colors.black),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      // DropdownButtonHideUnderline(
                      //   child: DropdownButton2(
                      //     isExpanded: true,
                      //     hint: Text(
                      //       S.current.DOB_empty_error,
                      //       style: TextStyle(
                      //         fontSize: 14,
                      //         color: Theme.of(context).hintColor,
                      //       ),
                      //     ),
                      //     items: genderOptions
                      //         .map((item) => DropdownMenuItem<String>(
                      //               value: item,
                      //               child: Text(
                      //                 item,
                      //                 style: const TextStyle(
                      //                   fontSize: 14,
                      //                 ),
                      //               ),
                      //             ))
                      //         .toList(),
                      //     value: ref.watch(selectedNationolityProvider),
                      //     onChanged: (value) {
                      //       ref
                      //           .read(selectedNationolityProvider.notifier)
                      //           .state = value.toString();
                      //     },
                      //     buttonHeight: 40,
                      //     buttonWidth: 200,
                      //     itemHeight: 40,
                      //     dropdownMaxHeight: 200,
                      //     searchController: searchTextController,
                      //     searchInnerWidgetHeight: 50,
                      //     searchInnerWidget: Container(
                      //       height: 50,
                      //       padding: const EdgeInsets.only(
                      //         top: 8,
                      //         bottom: 4,
                      //         right: 8,
                      //         left: 8,
                      //       ),
                      //       child: TextFormField(
                      //         expands: true,
                      //         maxLines: null,
                      //         controller: searchTextController,
                      //         decoration: InputDecoration(
                      //           isDense: true,
                      //           contentPadding: const EdgeInsets.symmetric(
                      //             horizontal: 10,
                      //             vertical: 8,
                      //           ),
                      //           hintText: S.current.search_country_hint,
                      //           hintStyle: TextStyle(fontSize: 8.sp),
                      //           border: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(8),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     searchMatchFn: (item, searchValue) {
                      //       return (item.value
                      //           .toString()
                      //           .contains(searchValue));
                      //     },
                      //     //This to clear the search value when you close the menu
                      //     onMenuStateChange: (isOpen) {
                      //       if (!isOpen) {
                      //         searchTextController.clear();
                      //       }
                      //     },
                      //   ),
                      // ),
                      Text(
                        S.current.signup_nationality_caption,
                        style: inputBoxCaptionStyle,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          buttonDecoration: BoxDecoration(
                              color: AppColors.fillInputColor,
                              borderRadius: BorderRadius.circular(3.w)),
                          buttonPadding: EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: 3.w),
                          icon: Icon(
                            Icons.search,
                            color: AppColors.greyBox,
                            size: 6.w,
                          ),

                          hint: Text(
                            S.current.signup_nationality_hint,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          items: isArabic
                              ? countriesData.map((item) {
                                  return DropdownMenuItem<String>(
                                    value: item.code ?? "",
                                    child: Text(
                                      item.nameAr ?? "",
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  );
                                }).toList()
                              : countriesData.map((item) {
                                  return DropdownMenuItem<String>(
                                    value: item.code ?? "",
                                    child: Text(
                                      item.name ?? "",
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  );
                                }).toList(),
                          value: selectedNationality,
                          onChanged: (value) {
                            ref
                                .read(selectedNationolityProvider.notifier)
                                .state = value.toString();
                          },
                          buttonHeight: 14.w,
                          buttonWidth: double.infinity,

                          // itemHeight: 40,
                          dropdownMaxHeight: 100.w,

                          searchController: searchTextController,
                          searchInnerWidgetHeight: 30.w,

                          dropdownWidth: double.infinity,

                          searchInnerWidget: Container(
                            height: 20.w,
                            padding: EdgeInsets.all(3.w),
                            child: TextFormField(
                              expands: true,
                              maxLines: null,
                              controller: searchTextController,
                              decoration: inputDecorationStyle.copyWith(
                                isDense: true,
                                // fillColor: AppColors.fillInputColor,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 3.w,
                                  vertical: 3.w,
                                ),
                                hintText: S.current.search_country,
                                hintStyle: TextStyle(fontSize: 10.sp),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3.w),
                                ),
                              ),
                            ),
                          ),
                          searchMatchFn: (item, searchValue) {
                            print(item.value
                                .toString()
                                .toLowerCase()
                                .contains(searchValue));
                            return (item.value
                                .toString()
                                .toLowerCase()
                                .contains(searchValue));
                          },
                          //This to clear the search value when you close the menu
                          onMenuStateChange: (isOpen) {
                            if (!isOpen) {
                              searchTextController.clear();
                            }
                          },
                        ),
                      ),
                      // Container(
                      //   width: double.infinity,
                      //   decoration: const BoxDecoration(
                      //     color: AppColors.fillInputColor,
                      //     borderRadius: BorderRadius.all(Radius.circular(10)),
                      //   ),
                      //   child: DropdownButton<String>(
                      //     onTap: () {},
                      //     underline: const SizedBox.shrink(),
                      //     items: genderOptions
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
                                      ref.read(selectedGenderProvider) ?? "",
                                      ref.read(selectedDateProvider),
                                      ref.read(selectedNationolityProvider) ??
                                          "");
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
