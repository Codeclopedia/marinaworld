// import '/controller/dataproviders.dart';
import 'package:marina_mall/core/state.dart';

import '../../../../controller/dataproviders.dart';
import '/core/constants.dart';
// import '/core/state.dart';
import '/core/ui_core.dart';
import '../../../widgets/app_top_bar.dart';
import '../../../widgets/bottom_bar.dart';

final List<Map> featuresList = [
  {
    "IconPath": "assets/images/Area.png",
    "title": S.current.about_area,
    "subtitle": "30,589 ${S.current.about_m}²",
  },
  {
    "IconPath": "assets/images/Brand.png",
    "title": S.current.about_brand,
    "subtitle": "194",
  },
  {
    "IconPath": "assets/images/Store.png",
    "title": S.current.about_shop,
    "subtitle": "165",
  },
  {
    "IconPath": "assets/images/Dining.png",
    "title": S.current.about_dining,
    "subtitle": "81",
  },
  {
    "IconPath": "assets/images/Cafe.png",
    "title": S.current.about_cafe,
    "subtitle": "10",
  },
  {
    "IconPath": "assets/images/Entertainment.png",
    "title": S.current.about_entertainment,
    "subtitle": "5",
  }
];

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
          const TopBarSearch(path: 'assets/images/About01.jpg', index: -1),
          Padding(
            padding: EdgeInsets.only(left: 8.w, right: 8.w),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: S.current.dtl_about,
                  style: TextStyle(
                    fontFamily: kFontFamily,
                    color: Colors.black,
                    fontSize: 5.w,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: ' ${S.current.about_mallname_part1}',
                  style: TextStyle(
                    fontFamily: kFontFamily,
                    color: Colors.black,
                    fontSize: 5.w,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: S.current.about_mallname_part2,
                  style: TextStyle(
                    fontFamily: kFontFamily,
                    color: const Color(0xFF0088C4),
                    fontSize: 5.w,
                    fontWeight: FontWeight.w600,
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
                            Consumer(builder: (context, ref, child) {
                              bool isArabic =
                                  ref.watch(languageStateProvider) ==
                                      langArabic;
                              return Text(
                                S.current.mall_about,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontFamily: kFontFamily,
                                  color: Colors.white,
                                  fontSize: isArabic ? 3.25.w : 3.w,
                                  height: 0.35.w,
                                  fontWeight: FontWeight.w300,
                                ),
                              );
                            }),
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
                            ),
                            GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 1.w,
                                      childAspectRatio: 0.8.w,
                                      crossAxisSpacing: 0.1.w),
                              itemCount: featuresList.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        featuresList[index]["IconPath"],
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                featuresList[index]["title"],
                                                style: TextStyle(
                                                    fontSize: 9.sp,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Text(
                                              featuresList[index]["subtitle"],
                                              style: TextStyle(
                                                  fontSize: 9.sp,
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
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
