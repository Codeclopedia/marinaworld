// ignore_for_file: prefer_const_constructors_in_immutables, use_build_context_synchronously

import '/data/models/models.dart';

import '/controller/dataproviders.dart';
import '../base_back_screen.dart';
import '/core/utils.dart';
import '/core/constants.dart';
import '/core/state.dart';
import '../../widgets/app_top_bar.dart';
import '../../widgets/bottom_bar.dart';
import '/core/ui_core.dart';

final selectedEditDateProvider =
    StateProvider<DateTime>(((ref) => DateTime.now()));
final selectedEditGenderProvider =
    StateProvider<String>(((ref) => S.current.signup_gender_hint));
// final selectedEditNationolityProvider =
//     StateProvider<String>(((ref) => S.current.signup_nationality_hint));

// ignore: must_be_immutable
class EditProfileScreen extends HookConsumerWidget {
  final User user;
  EditProfileScreen({Key? key, required this.user}) : super(key: key);

  final genderOptions = [
    S.current.signup_gender_option_male,
    S.current.signup_gender_option_female,
    // S.current.signup_gender_option_other,
  ];

  // final countriesOptions = ["Kuwait", "India"];

  final formKey = GlobalKey<FormState>();
  late DateTime _selectedDate;

  late TextEditingController nameController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      nameController = TextEditingController(text: user.name);
      // ref.refresh(selectedEditDateProvider);
      // ref.refresh(selectedEditGenderProvider);
      // ref.invalidate(selectedEditNationolityProvider);
      return () {
        nameController.dispose();
      };
    });

    String selectedGender = ref.watch(selectedEditGenderProvider);
    // final selectedNationality = ref.watch(selectedEditNationolityProvider);

    _selectedDate = ref.watch(selectedEditDateProvider);

    return BaseWilPopupScreen(
      onBack: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopBarSearch(
                path: 'assets/images/events_bg.png',
                index: -1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Text(
                  S.current.edit_profile_title.toUpperCase(),
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
                      // SizedBox(height: 2.h),
                      // Text(
                      //   S.current.leasing_heading,
                      //   style: TextStyle(
                      //     fontFamily: kFontFamily,
                      //     color: const Color(0xFF8D8D8D),
                      //     fontSize: 11.6.sp,
                      //     fontWeight: FontWeight.w600,
                      //   ),
                      // ),
                      SizedBox(height: 2.h),
                      TextFormField(
                        controller: nameController,
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: AppColors.fillInputColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: DropdownButton<String>(
                                onTap: () {},
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
                                      .read(selectedEditGenderProvider.notifier)
                                      .state = v ?? selectedGender;
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
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                _selectDate(context, ref);
                              },
                              child: Container(
                                padding: EdgeInsets.all(3.w),
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
                      // SizedBox(height: 1.h),
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
                      //           .read(selectedEditNationolityProvider.notifier)
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
                      SizedBox(height: 4.h),
                      Consumer(builder: (context, ref, child) {
                        return ElevatedButton(
                            style: elevatedButtonTextStyle,
                            onPressed: () async {
                              if (formKey.currentState?.validate() == true) {
                                showLoading(ref);
                                final error = await ref
                                    .read(remoteRepositoryProvider)
                                    .editProfile(
                                      user,
                                      nameController.text.trim(),
                                      ref.read(selectedEditGenderProvider),
                                      ref.read(selectedEditDateProvider),
                                    );
                                // EasyLoading.dismiss();
                                hideLoading(ref);
                                if (error != null) {
                                  AppSnackbar.instance.error(context, error);
                                } else {
                                  Navigator.pop(context, true);
                                }
                              }
                            },
                            child: Text(S.current.clang_btn_submit));
                      }),
                      SizedBox(height: 2.h),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteNames.changePassword,
                                arguments: user.phone);
                          },
                          child: Text(
                            S.current.change_password,
                            style:
                                TextStyle(color: Colors.blue, fontSize: 10.sp),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
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
      ),
    );
  }

  // _pickFile(WidgetRef ref) async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowMultiple: false,
  //     allowedExtensions: ['pdf', 'doc', 'jpg', 'jpeg', 'png', 'docx'],
  //   );
  //   if (result != null) {
  //     PlatformFile file = result.files.first;
  //     ref.read(attachedFile.notifier).state = file;
  //   }
  // }

  // Widget _buildFloorDropDown(
  //     List<String?> options, String? value, Function(String?) onChanged) {
  //   return Container(
  //     height: 15.w,
  //     width: double.infinity,
  //     alignment: Alignment.centerLeft,
  //     decoration: BoxDecoration(
  //       color: const Color(0xFFF0F0F0),
  //       borderRadius: BorderRadius.all(Radius.circular(3.w)),
  //     ),
  //     child: DropdownButton<String>(
  //       underline: const SizedBox.shrink(),
  //       onTap: () {},
  //       items: options.map<DropdownMenuItem<String>>((String? value) {
  //         return DropdownMenuItem<String>(
  //           value: value,
  //           child: Padding(
  //             padding: EdgeInsets.only(left: 4.w, right: 4.w),
  //             child: Text(
  //                 //isArabic
  //                 value ?? S.current.floor_required),
  //           ),
  //         );
  //       }).toList(),
  //       value: value,
  //       onChanged: onChanged,
  //       isExpanded: true,
  //       iconSize: 8.w,
  //       icon: Padding(
  //         padding: EdgeInsets.all(2.w),
  //         child: const Icon(
  //           Icons.arrow_drop_down,
  //           color: AppColors.primaryColor,
  //         ),
  //       ),
  //       dropdownColor: const Color(0xFFF5FCFF),
  //       hint: Container(
  //         // width: 75.w,
  //         // width: double.infinity,
  //         padding: EdgeInsets.only(left: 4.w),
  //         child: Text(
  //           S.current.floor_required,
  //           style: hintTextStyle.copyWith(
  //             fontWeight: FontWeight.w700,
  //             color: Colors.black54,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _inputBox(TextEditingController controller, String hint,
  //     {required TextInputType inputType,
  //     required String? Function(String?) validator}) {
  //   return TextFormField(
  //     textInputAction: TextInputAction.next,
  //     maxLines: inputType == TextInputType.multiline ? 4 : 1,
  //     controller: controller,
  //     keyboardType: inputType,
  //     decoration: formFieldInputDecoration.copyWith(hintText: hint),
  //     validator: validator,
  //   );
  // }

  // Future showSuccessDialog(BuildContext context) {
  //   return showDialog(
  //       context: context,
  //       builder: (context) => Dialog(
  //             backgroundColor: Colors.white,
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.all(Radius.circular(3.w))),
  //             child: const SuccessDialog(),
  //           ));
  // }
  Future<void> _selectDate(BuildContext context, WidgetRef ref) async {
    final now = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(now.year - 150),
        lastDate: now);
    // print(picked);
    if (picked != null && picked != _selectedDate) {
      // _selectedDate = picked;
      // print(_selectedDate);
      ref.read(selectedEditDateProvider.notifier).state = picked;
      // ref.invalidate(selectedEditDateProvider);
      // print(ref.read(selectedEditDateProvider));
    }
  }
}
