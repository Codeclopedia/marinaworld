// ignore_for_file: prefer_const_constructors_in_immutables, use_build_context_synchronously

import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:marina_mall/controller/dataproviders.dart';
import '/core/utils.dart';
import '/data/network/api_service.dart';
import '/ui/screens/base_back_screen.dart';

import '/core/constants.dart';
import '/core/state.dart';
import '../../widgets/app_top_bar.dart';
import '../../widgets/bottom_bar.dart';
import '/core/ui_core.dart';

final attachedFile = StateProvider.autoDispose<PlatformFile?>((_) => null);

final selectedFloorProvider = StateProvider.autoDispose<String?>((_) => null);

class LeasingScreen extends HookWidget {
  LeasingScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  final listFloors = [
    S.current.floor_ground,
    S.current.floor_first,
    S.current.floor_second,
  ];
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = useTextEditingController();
    final TextEditingController areaController = useTextEditingController();
    final TextEditingController intentedController = useTextEditingController();
    final TextEditingController brandController = useTextEditingController();
    final TextEditingController addressController = useTextEditingController();
    final TextEditingController phoneController = useTextEditingController();
    final TextEditingController faxController = useTextEditingController();

    final TextEditingController emailController = useTextEditingController();

    final TextEditingController otlocController = useTextEditingController();
    final TextEditingController otbuzController = useTextEditingController();
    // final TextEditingController messageController = useTextEditingController();

    // useEffect(() {
    //   nameController = TextEditingController();
    //   phoneController = TextEditingController();
    //   emailController = TextEditingController();
    //   messageController = TextEditingController();

    //   return () {
    //     nameController.dispose();
    //     phoneController.dispose();
    //     emailController.dispose();
    //     messageController.dispose();
    //   };
    // }, []);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopBarSearch(
              path: 'assets/images/Leasing-Banner.jpg',
              index: -1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Text(
                S.current.leasing_title.toUpperCase(),
                style: TextStyle(
                  fontFamily: kFontFamily,
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFBFBFB),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.w),
                  topRight: Radius.circular(5.w),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // SizedBox(height: 2.h),
                    // Consumer(builder: (context, ref, child) {
                    //   bool isArabic =
                    //       ref.watch(languageStateProvider) == langArabic;
                    //   return isArabic
                    //       ? Container()
                    //       : Text(
                    //           S.current.leasing_description,
                    //           textAlign: TextAlign.justify,
                    //           style: TextStyle(
                    //             fontFamily: kFontFamily,
                    //             color: const Color(0xFF8D8D8D),
                    //             fontSize: 11.sp,
                    //             fontWeight: FontWeight.w400,
                    //           ),
                    //         );
                    // }),
                    SizedBox(height: 2.h),
                    Text(
                      S.current.leasing_heading,
                      style: TextStyle(
                        fontFamily: kFontFamily,
                        color: const Color(0xFF8D8D8D),
                        fontSize: 11.5.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    _inputBox(
                      nameController,
                      S.current.leasing_name_hint,
                      inputType: TextInputType.name,
                      validator: (value) {
                        if (value?.trim().isNotEmpty == true) {
                          if (value!.trim().length < 3) {
                            return S.current.contact_name_invalid;
                          }
                          return null;
                        }
                        return S.current.contact_name_empty;
                      },
                    ),
                    SizedBox(height: 2.h),
                    _inputBox(
                      areaController,
                      S.current.leasing_area_hint,
                      inputType: TextInputType.name,
                      validator: (value) {
                        if (value?.trim().isNotEmpty == true) {
                          return null;
                        }
                        return S.current.leasing_field_empty_error;
                      },
                    ),
                    SizedBox(height: 2.h),
                    Consumer(builder: (context, ref, child) {
                      return _buildFloorDropDown(
                        listFloors,
                        ref.watch(selectedFloorProvider),
                        (floor) => ref
                            .read(selectedFloorProvider.notifier)
                            .state = floor,
                      );
                    }),
                    SizedBox(height: 2.h),
                    _inputBox(
                      intentedController,
                      S.current.leasing_intended_hint,
                      inputType: TextInputType.name,
                      validator: (value) {
                        if (value?.trim().isNotEmpty == true) {
                          return null;
                        }
                        return S.current.leasing_field_empty_error;
                      },
                    ),
                    SizedBox(height: 2.h),
                    _inputBox(
                      brandController,
                      S.current.leasing_brand_hint,
                      inputType: TextInputType.name,
                      validator: (value) {
                        if (value?.trim().isNotEmpty == true) {
                          return null;
                        }
                        return S.current.leasing_field_empty_error;
                      },
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      S.current.leasing_file_caption,
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: const Color(0xFF8D8D8D),
                          fontFamily: kFontFamily,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 1.h),
                    Container(
                      padding: EdgeInsets.only(
                          left: 4.w, right: 4.w, top: 4.w, bottom: 4.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F0F0),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Consumer(builder: (context, ref, child) {
                        final file = ref.watch(attachedFile);
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _pickFile(ref);
                                // showSuccessDialog(context);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.w, vertical: 1.w),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black87, width: 0.5),
                                ),
                                child: Text(
                                  S.current.leasing_file_btn,
                                  style: TextStyle(
                                    fontFamily: kFontFamily,
                                    fontSize: 8.sp,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 3.w),
                            Expanded(
                              child: Text(
                                file?.name ?? S.current.leasing_file_hint,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: kFontFamily,
                                  fontSize: 8.sp,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                    SizedBox(height: 2.h),
                    const Divider(
                      height: 1,
                      color: Color(0xFFAAAAAA),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      S.current.leasing_contact_caption.toUpperCase(),
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.black,
                          fontFamily: kFontFamily,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 2.h),
                    _inputBox(
                      addressController,
                      S.current.leasing_contact_address_hint,
                      inputType: TextInputType.name,
                      validator: (value) {
                        if (value?.trim().isNotEmpty == true) {
                          return null;
                        }
                        return S.current.leasing_field_empty_error;
                      },
                    ),
                    SizedBox(height: 2.h),
                    _inputBox(
                      phoneController,
                      S.current.leasing_contact_phone_hint,
                      inputType: TextInputType.phone,
                      validator: (value) {
                        if (value?.trim().isNotEmpty == true) {
                          if (value!.trim().length < 8) {
                            return S.current.signup_mobile_invalid;
                          }
                          return null;
                        }
                        return S.current.signup_mobile_empty;
                      },
                    ),
                    SizedBox(height: 2.h),
                    _inputBox(
                      faxController,
                      S.current.leasing_contact_fax_hint,
                      inputType: TextInputType.phone,
                      validator: (value) {
                        if (value?.trim().isNotEmpty == true) {
                          return null;
                        }
                        return S.current.leasing_field_empty_error;
                      },
                    ),
                    SizedBox(height: 2.h),
                    _inputBox(
                      emailController,
                      S.current.leasing_contact_email_hint,
                      inputType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value?.trim().isNotEmpty == true) {
                          if (!isValidEmail(value!.trim())) {
                            return S.current.signup_email_invalid;
                          }
                          return null;
                        }
                        return S.current.signup_email_empty;
                      },
                    ),
                    SizedBox(height: 2.h),
                    _inputBox(
                      otlocController,
                      S.current.leasing_contact_otherloc_hint,
                      inputType: TextInputType.streetAddress,
                      validator: (value) {
                        if (value?.trim().isNotEmpty == true) {
                          return null;
                        }
                        return S.current.leasing_field_empty_error;
                      },
                    ),
                    SizedBox(height: 2.h),
                    _inputBox(
                      otbuzController,
                      S.current.leasing_contact_otherbuz_hint,
                      inputType: TextInputType.streetAddress,
                      validator: (value) {
                        if (value?.trim().isNotEmpty == true) {
                          return null;
                        }
                        return S.current.leasing_field_empty_error;
                      },
                    ),
                    SizedBox(height: 4.h),
                    Consumer(builder: (context, ref, child) {
                      return ElevatedButton(
                          style: elevatedButtonTextStyle,
                          onPressed: () async {
                            if (formKey.currentState?.validate() == true &&
                                ref.read(selectedFloorProvider) != null) {
                              showLoading(ref);
                              final result = await ref
                                  .read(apiServiceProvider)
                                  .postLeasing(
                                    name: nameController.text.trim(),
                                    area: areaController.text.trim(),
                                    floor: ref.read(selectedFloorProvider)!,
                                    intendedUse: intentedController.text.trim(),
                                    brandName: brandController.text.trim(),
                                    address: addressController.text.trim(),
                                    telephone: phoneController.text.trim(),
                                    fax: faxController.text.trim(),
                                    email: emailController.text.trim(),
                                    otherLocations: otlocController.text.trim(),
                                    otherBusinesses:
                                        otbuzController.text.trim(),
                                    document: ref.read(attachedFile),
                                  );
                              hideLoading(ref);

                              if (result.status != 'error') {
                                await showSuccessDialog(context,
                                    S.current.thankyou_message_leasing);

                                // AppSnackbar.instance.message(
                                //     context, 'Form Submitted successfully');
                                // await Future.delayed(
                                //     const Duration(seconds: 1));
                                Navigator.pop(context);
                              } else {
                                AppSnackbar.instance.error(context,
                                    result.message ?? 'Error while submitting');
                              }
                            } else {
                              if (ref.read(selectedFloorProvider) == null) {
                                AppSnackbar.instance
                                    .error(context, 'Please select floor');
                              }
                            }
                          },
                          child: Text(S.current.clang_btn_submit));
                    }),
                    SizedBox(height: 3.h),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
          color: const Color(0xFFFBFBFB),
          child: const BottomBar(currentIndex: -1)),
    );
  }

  _pickFile(WidgetRef ref) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['pdf', 'doc', 'jpg', 'jpeg', 'png', 'docx'],
    );
    if (result != null) {
      PlatformFile file = result.files.first;
      ref.read(attachedFile.notifier).state = file;
    }
  }

  Widget _buildFloorDropDown(
      List<String?> options, String? value, Function(String?) onChanged) {
    return Container(
      height: 15.w,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F0),
        borderRadius: BorderRadius.all(Radius.circular(3.w)),
      ),
      child: DropdownButton<String>(
        underline: const SizedBox.shrink(),
        onTap: () {},
        items: options.map<DropdownMenuItem<String>>((String? value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: EdgeInsets.only(left: 4.w, right: 4.w),
              child: Text(
                  //isArabic
                  value ?? S.current.floor_required),
            ),
          );
        }).toList(),
        value: value,
        onChanged: onChanged,
        isExpanded: true,
        iconSize: 8.w,
        icon: Padding(
          padding: EdgeInsets.all(2.w),
          child: const Icon(
            Icons.arrow_drop_down,
            color: AppColors.primaryColor,
          ),
        ),
        dropdownColor: const Color(0xFFF0F0F0),
        hint: Container(
          // width: 75.w,
          // width: double.infinity,
          padding: EdgeInsets.only(
            left: 4.w,
          ),
          child: Text(
            S.current.floor_required,
            style: hintTextStyle.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputBox(TextEditingController controller, String hint,
      {required TextInputType inputType,
      required String? Function(String?) validator}) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      maxLines: inputType == TextInputType.multiline ? 4 : 1,
      controller: controller,
      autocorrect: inputType != TextInputType.emailAddress,
      keyboardType: inputType,
      decoration: formFieldInputDecoration.copyWith(
          hintText: hint,
          hintStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 10.sp)),
      validator: validator,
    );
  }

  Future showSuccessDialog(BuildContext context, String message) {
    return showDialog(
        context: context,
        builder: (context) => Dialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(3.w))),
              child: SuccessDialog(message: message),
            ));
  }
}

class SuccessDialog extends StatelessWidget {
  final String message;
  const SuccessDialog({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.sentiment_very_satisfied_outlined,
            color: AppColors.primaryColor,
            size: 20.w,
          ),
          SizedBox(height: 2.w),
          Text(
            S.current.thankyou_title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: kFontFamily,
                color: Colors.black,
                fontSize: 11.5.sp,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 2.w),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.w),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: kFontFamily,
                  color: Colors.black,
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: 6.w),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                          fontFamily: kFontFamily,
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w400),
                      // foregroundColor: Colors.white,
                      backgroundColor: AppColors.primaryColor),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text(
                    S.current.btn_ok.toUpperCase(),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
