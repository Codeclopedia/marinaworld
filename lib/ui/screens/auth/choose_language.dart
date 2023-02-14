import '/controller/dataproviders.dart';
import '/core/constants.dart';
import '/core/state.dart';
import '/core/ui_core.dart';
import '../../widgets/top_image_screen.dart';
import '../base_back_screen.dart';

final localLangugeProvier =
    StateProvider<String>((ref) => ref.watch(languageStateProvider));

class ChooseLanguageScreen extends StatelessWidget {
  final bool loadLogin;
  ChooseLanguageScreen({Key? key, this.loadLogin = false}) : super(key: key);

  final languagesOptions = [
    langEnglish,
    langArabic,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TopImageScreen(
        onBack: loadLogin ? null : () => Navigator.pop(context),
        imageName: 'language_bg.png',
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.current.clang_greeting,
                  style: screenHeaderTitleStyle,
                ),
                SizedBox(height: 0.5.h),
                Text(
                  S.current.clang_message,
                  style: captionTextStyle,
                ),
                SizedBox(height: 3.h),
                Text(
                  S.current.clang_caption,
                  style: inputBoxCaptionStyle,
                ),
                SizedBox(height: 1.h),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.fillInputColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Consumer(builder: (context, ref, child) {
                    final language = ref.watch(localLangugeProvier);
                    return DropdownButton<String>(
                      onTap: () {},
                      underline: const SizedBox.shrink(),
                      items: languagesOptions
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: EdgeInsets.only(left: 3.w, right: 3.w),
                            child: Text(value),
                          ),
                        );
                      }).toList(),
                      value: language,
                      onChanged: (v) {
                        ref.read(localLangugeProvier.notifier).state =
                            v ?? langEnglish;
                      },
                      hint: Container(
                        width: 75.w,
                        padding: EdgeInsets.only(left: 2.w, right: 2.w),
                        child: Text(
                          S.current.clang_hint,
                          style: hintTextStyle,
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 3.h),
                Consumer(
                  builder: (context, ref, child) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: elevatedButtonTextStyle,
                          onPressed: () {
                            _goHome(context, ref);
                          },
                          child: Text(S.current.clang_btn_submit)),
                    );
                  },
                ),
                SizedBox(height: 1.5.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _goHome(BuildContext context, WidgetRef ref) async {
    showLoading(ref);
    // await pref.setString('language', language);
    final language = ref.read(localLangugeProvier);
    ref.read(languageStateProvider.notifier).setLanguage(language);

    Future.delayed(const Duration(seconds: 1)).then((value) {
      hideLoading(ref);
      if (loadLogin) {
        Navigator.pushReplacementNamed(context, RouteNames.login);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, RouteNames.home, (route) => route.isFirst);
      }
      // Navigator.pop(context, true);
    });
  }
}
