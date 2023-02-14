// ignore_for_file: prefer_const_constructors_in_immutables, use_build_context_synchronously

import 'dart:io';

import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '/core/utils.dart';
import '/data/network/api_service.dart';
import '/ui/screens/base_back_screen.dart';

import '/core/constants.dart';
import '/core/state.dart';
import '../../widgets/app_top_bar.dart';
import '../../widgets/bottom_bar.dart';
import '/core/ui_core.dart';

class ContactUsScreen extends HookWidget {
  ContactUsScreen({Key? key}) : super(key: key);

  // late final TextEditingController _nameController;
  // late final TextEditingController _phoneController;
  // late final TextEditingController _emailController;
  // late final TextEditingController _messageController;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = useTextEditingController();
    final TextEditingController phoneController = useTextEditingController();
    final TextEditingController emailController = useTextEditingController();
    final TextEditingController messageController = useTextEditingController();

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
              path: 'assets/images/contact_bg.png',
              index: -1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Text(
                S.current.contact_title.toUpperCase(),
                style: TextStyle(
                  fontFamily: kFontFamily,
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
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
                    SizedBox(height: 2.h),
                    Text(
                      S.current.contact_desc,
                      style: TextStyle(
                        fontFamily: kFontFamily,
                        color: Color(0xFF8D8D8D),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    _inputBox(
                      nameController,
                      S.current.contact_hint_name,
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
                      phoneController,
                      S.current.contact_hint_phone,
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
                      emailController,
                      S.current.contact_hint_email,
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
                      messageController,
                      S.current.contact_hint_message,
                      inputType: TextInputType.multiline,
                      validator: (value) {
                        if (value?.trim().isNotEmpty == true) {
                          if (value!.trim().length < 3) {
                            return S.current.contact_message_invalid;
                          }
                          return null;
                        }
                        return S.current.contact_message_empty;
                      },
                    ),
                    SizedBox(height: 4.h),
                    Consumer(builder: (context, ref, child) {
                      return ElevatedButton(
                          style: elevatedButtonTextStyle,
                          onPressed: () async {
                            if (formKey.currentState?.validate() == true) {
                              final error = await _postContact(
                                  ref,
                                  nameController.text.trim(),
                                  phoneController.text.trim(),
                                  emailController.text.trim(),
                                  messageController.text.trim());
                              if (error == null) {
                                AppSnackbar.instance.message(
                                    context, 'Form Submitted successfully');
                                await Future.delayed(
                                    const Duration(seconds: 1));
                                Navigator.pop(context);
                              } else {
                                AppSnackbar.instance.error(context, error);
                              }
                            }
                          },
                          child: Text(S.current.fp_btn_submit));
                    }),
                    SizedBox(height: 3.h),
                    const Divider(color: Color(0x66000000), height: 1),
                    SizedBox(height: 4.h),
                    _buildRow(
                        'icon_map_pin.svg', S.current.contact_info_location),
                    SizedBox(height: 1.w),
                    _buildDesc('Salem Mubarak Street, Gulf Road, Kuwait'),
                    SizedBox(height: 3.h),
                    _buildRow('icon_email.svg', S.current.contact_info_email),
                    SizedBox(height: 1.w),
                    GestureDetector(
                        onTap: () async {
                          Uri uri = Uri.parse('mailto:marina.info@urc.com.kw');
                          if (await canLaunchUrl(uri)) {
                            launchUrl(uri);
                          } else {
                            AppSnackbar.instance
                                .error(context, 'Error in launching mail');
                          }
                        },
                        child: _buildDesc('marina.info@urc.com.kw')),
                    SizedBox(height: 3.h),
                    _buildRow('icon_call.svg', S.current.contact_info_contact),
                    SizedBox(height: 1.w),
                    GestureDetector(
                        onTap: () async {
                          Uri uri = Uri.parse('tel:+9651899199');
                          if (await canLaunchUrl(uri)) {
                            launchUrl(uri);
                          } else {
                            AppSnackbar.instance
                                .error(context, 'Error in launching phone');
                            print('Error in launching tel');
                          }
                        },
                        child: _buildDesc('(+965) 1899199')),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        SizedBox(width: 5.w),
                        Consumer(builder: (context, ref, child) {
                          return TextButton(
                              onPressed: () async {
                                // Uri uri = Uri.parse('https://www.google.com/maps/@?api=1&map_action=map&');
                                Uri uri = Uri.parse(
                                    'https://www.google.com/maps/dir//Marina+Mall+Salem+Al+Mubarak+St+Salmiya+Kuwait/@29.3392739,48.0656684');
                                //
                                if (Platform.isIOS) {
                                  uri = Uri.parse(
                                      'http://maps.apple.com/?ll=29.339237,48.065765');
                                }

                                if (await canLaunchUrl(uri)) {
                                  launchUrl(uri);
                                } else {
                                  AppSnackbar.instance
                                      .error(context, 'Error in launching map');
                                  // print('Error in launching');
                                }
                              },
                              child: Text(
                                S.current.contact_btx_locate,
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: AppColors.primaryColor,
                                    fontFamily: kFontFamily,
                                    fontSize: 12.sp),
                              ));
                        }),
                      ],
                    ),
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

  Future<String?> _postContact(WidgetRef ref, String name, String phone,
      String email, String message) async {
    showLoading(ref);
    final result = await ref
        .read(apiServiceProvider)
        .postContact(name, phone, email, message);
    hideLoading(ref);
    if (result.status != 'error') {
      return null;
    }
    return 'Error while submitting form';
  }

  Widget _inputBox(TextEditingController controller, String hint,
      {required TextInputType inputType,
      required String? Function(String?) validator}) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      maxLines: inputType == TextInputType.multiline ? 4 : 1,
      controller: controller,
      keyboardType: inputType,
      autocorrect: inputType != TextInputType.emailAddress,
      decoration: formFieldInputDecoration.copyWith(hintText: hint),
      validator: validator,
    );
  }

  Widget _buildRow(String icon, String caption) {
    return Row(
      children: [
        SvgPicture.asset('assets/svg/$icon', width: 4.w),
        SizedBox(width: 3.w),
        Text(
          caption.toUpperCase(),
          style: TextStyle(
              fontFamily: kFontFamily,
              fontSize: 11.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildDesc(String desc, {double? left}) {
    return Padding(
      padding: EdgeInsets.only(
        left: left ?? 7.w,
        right: 20.w,
      ),
      child: Text(
        desc,
        style: TextStyle(
          fontFamily: kFontFamily,
          fontSize: 10.sp,
          fontWeight: FontWeight.w300,
          color: const Color(0xFF4B4B4B),
        ),
      ),
    );
  }
}
