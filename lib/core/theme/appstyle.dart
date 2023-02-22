import 'package:pinput/pinput.dart';

import '../constants.dart';
import '../ui_core.dart';

String kFontFamily = 'euclid-circular';

TextStyle get screenHeaderTitleStyle => TextStyle(
      fontSize: 17.sp,
      fontFamily: kFontFamily,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );

TextStyle get normalTextStyle => TextStyle(
      fontSize: 11.sp,
      fontFamily: kFontFamily,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
TextStyle get captionTextStyle => TextStyle(
      fontFamily: kFontFamily,
      fontSize: 11.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF999EA1),
    );
//
// const buttonTextStyle = TextStyle(
//   fontWeight: FontWeight.w600,
//   fontSize: 17,
//   color: Colors.white,
// );

//  checkBoxStyle(BuildContext context){
// Theme.of(context).checkboxTheme.copyWith(
//   checkColor: Colors.black,
//   fillColor: Colors.transparent,
// )
// }

get elevatedButtonTextStyle => ElevatedButton.styleFrom(
      textStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: kFontFamily,
        fontSize: 11.sp,
        color: Colors.white,
      ),
      backgroundColor: AppColors.primaryColor,
      padding: EdgeInsets.all(3.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    );

TextStyle? get inputBoxCaptionStyle => TextStyle(
    fontFamily: kFontFamily,
    fontSize: 12.sp,
    color: AppColors.blueCaptionText,
    fontWeight: FontWeight.w500);

final textButtonStyle = TextButton.styleFrom(
  foregroundColor: AppColors.primaryColor,
  padding: const EdgeInsets.all(12.0),
);

final hintTextStyle = TextStyle(
  fontSize: 11.sp,
  fontFamily: kFontFamily,
  fontWeight: FontWeight.w600,
  color: AppColors.hintTextColor,
);

InputDecoration get inputDecorationStyle => InputDecoration(
      fillColor: AppColors.fillInputColor,
      filled: true,
      hintStyle: TextStyle(
        fontFamily: kFontFamily,
        fontSize: 10.sp,
        color: AppColors.hintTextColor,
        fontWeight: FontWeight.w400,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: AppColors.primaryColor, width: 0.0),
      ),
      border: OutlineInputBorder(
        gapPadding: 4.0,
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
      ),
    );

InputDecoration searchInputDirectionStyle = InputDecoration(
  fillColor: const Color(0xFFF0F0F0),
  filled: true,
  hintStyle: TextStyle(
    fontFamily: kFontFamily,
    fontSize: 11.sp,
    color: AppColors.hintTextColor,
    fontWeight: FontWeight.w500,
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
  ),
  border: OutlineInputBorder(
    gapPadding: 4.0,
    borderRadius: BorderRadius.circular(12.0),
    borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
  ),
);

InputDecoration get formFieldInputDecoration => InputDecoration(
      fillColor: const Color(0xFFF0F0F0),
      filled: true,
      contentPadding:
          EdgeInsets.only(left: 4.w, right: 4.w, top: 4.w, bottom: 4.w),
      hintStyle: TextStyle(
        fontFamily: kFontFamily,
        fontSize: 10.sp,
        color: AppColors.hintTextColor,
        fontWeight: FontWeight.w400,
      ),
      focusColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.0),
      ),
      border: OutlineInputBorder(
        gapPadding: 4.0,
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
      ),
    );
final textButtonTextStyle = TextStyle(
  fontFamily: kFontFamily,
  fontWeight: FontWeight.w600,
  fontSize: 11.sp,
);

final storeTextStyle = TextStyle(
    fontFamily: kFontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 8.sp,
    color: Colors.black);

final footerTextStyle = TextStyle(
  fontFamily: kFontFamily,
  fontWeight: FontWeight.w600,
  fontSize: 11.sp,
  color: AppColors.greyColor,
);
final footerTextButtonStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 11.sp,
  color: AppColors.darkBlue,
);

final PinTheme defaultPinTheme = PinTheme(
  width: 20.w,
  height: 12.w,
  textStyle: TextStyle(
    fontSize: 15.sp,
    color: const Color.fromRGBO(30, 60, 87, 1),
    fontWeight: FontWeight.w600,
  ),
  decoration: BoxDecoration(
    color: AppColors.fillInputColor,
    //border: Border.all(color: AppColors.inputBoxBorder),
    borderRadius: BorderRadius.circular(8),
  ),
);

final PinTheme focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: const Color(0xFF0088C4)),
  borderRadius: BorderRadius.circular(1),
);

final PinTheme submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration?.copyWith(
    color: const Color.fromRGBO(234, 239, 243, 1),
  ),
);

final TextStyle homeCaptionStyle = TextStyle(
  color: AppColors.black,
  fontWeight: FontWeight.w500,
  fontFamily: kFontFamily,
  fontSize: 12.sp,
);

final TextStyle homeViewAllStyle = TextStyle(
  color: AppColors.black,
  fontWeight: FontWeight.w500,
  fontFamily: kFontFamily,
  fontSize: 9.sp,
);
