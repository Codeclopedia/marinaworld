// import '/controller/dataproviders.dart';
import '/core/constants.dart';
// import '/core/state.dart';
import '/core/ui_core.dart';
import '../../../widgets/app_top_bar.dart';
import '../../../widgets/bottom_bar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // _buildTopBar(),
          const TopBarSearch(path: 'assets/images/about_bg.png', index: -1),
          Padding(
            padding: EdgeInsets.only(left: 8.w, right: 8.w),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: S.current.dtl_about,
                  style: TextStyle(
                    fontFamily: kFontFamily,
                    color: Colors.black,
                    fontSize: 6.w,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: ' ${S.current.about_mallname}',
                  style: TextStyle(
                    fontFamily: kFontFamily,
                    color: Colors.black,
                    fontSize: 6.w,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ]),
            ),
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(top: 4.w),
                decoration: BoxDecoration(
                    color: const Color(0xFF0088C4),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(3.w),
                        topRight: Radius.circular(3.w))),
                child: Column(
                  children: [
                    Expanded(
                        child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 7.w, vertical: 4.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              S.current.mall_about,
                              style: TextStyle(
                                fontFamily: kFontFamily,
                                color: Colors.white,
                                fontSize: 2.8.w,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(height: 4.w),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: S.current.mall_about_span1,
                                  style: TextStyle(
                                    fontFamily: kFontFamily,
                                    color: Colors.white,
                                    fontSize: 7.w,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ${S.current.mall_about_span2}',
                                  style: TextStyle(
                                    fontFamily: kFontFamily,
                                    color: Colors.white,
                                    fontSize: 7.w,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ]),
                            ),
                            Text(
                              S.current.mall_about_footer,
                              style: TextStyle(
                                fontFamily: kFontFamily,
                                color: Colors.white,
                                fontSize: 2.8.w,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                    const BottomBar(currentIndex: -1)
                  ],
                )),
          ),
          // const BottomBar(currentIndex: -1),
          // _bottomNavigation()
        ],
      ),
      // bottomNavigationBar: const BottomBar(currentIndex: -1),
      // bool isArabic = ref.watch(languageStateProvider) == langArabic;
    );
  }
}
