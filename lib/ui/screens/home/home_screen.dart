import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeleton_text/skeleton_text.dart';
import '/data/models/response/home_response.dart';
import '/data/models/response/stores_response.dart';
import '/controller/dataproviders.dart';
import '/core/constants.dart';
import '/core/state.dart';
import '/core/ui_core.dart';
import '../../widgets/app_top_bar.dart';

import '../../widgets/bottom_bar.dart';
import '../../widgets/common.dart';
import 'categories_screen.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  _init() async {
    try {
      FirebaseMessaging.instance.subscribeToTopic('news');

      // final token = await FirebaseMessaging.instance.getToken();
      // print('$token');
      FirebaseMessaging.onMessage.listen((event) {
        print('${event.data} => ${event.notification}');
      });
      NotificationSettings settings =
          await FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        await FirebaseMessaging.instance
            .setForegroundNotificationPresentationOptions(
          alert: true, // Required to display a heads up notification
          badge: true,
          sound: true,
        );
        print('User granted permission');
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
        print('User granted provisional permission');
      } else {
        print('User declined or has not accepted permission');
      }
    } catch (e) {
      print('Error in subscribing');
    }
  }

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      _init();
      return () {};
    }, []);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // _buildTopBar(),
            TopBarSearch(
              path: 'assets/images/home_bg.png',
              index: 0,
              otherView: Container(
                padding: EdgeInsets.only(top: 10.h),
                alignment: Alignment.bottomCenter,
                height: 32.h,
                child: _topContent(),
              ),
            ),

            Consumer(
              builder: (context, ref, child) {
                bool isArabic = ref.watch(languageStateProvider) == langArabic;
                return ref.watch(homeProvider).when(
                    data: (data) {
                      if (data != null) {
                        return _buildHome(context, data, isArabic);
                      } else {
                        return buildEmptyLoading('message');
                      }
                    },
                    error: (er, st) =>
                        buildEmptyLoading('Error while loading app'),
                    loading: () => _buildLoading(isArabic));
              },
            ),
            // const BottomBar(currentIndex: 0),
            // _bottomNavigation()
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(currentIndex: 0),
    );
  }

  Widget _buildHome(BuildContext context, HomeBody body, bool isArabic) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSection(S.current.home_sec_category, isArabic, () {
          Navigator.pushNamed(context, RouteNames.categories);
        }),

        // _buildBrands(),
        body.categories?.isNotEmpty == true
            ? _buildCategories(body.categories!, body, isArabic)
            : _buildContentNone(S.current.stores_empty),

        _buildSection(S.current.home_sec_brand, isArabic, () {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteNames.stores, (route) => route.isFirst);
        }),

        // _buildBrands(),
        body.stores?.isNotEmpty == true
            ? _buildBrands(body.stores!, isArabic)
            : _buildContentNone(S.current.stores_empty),
        _buildSection(S.current.home_sec_dining, isArabic, () {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteNames.dining, (route) => route.isFirst);
        }),
        body.dinings?.isNotEmpty == true
            ? _buildBrands(body.dinings!, isArabic)
            : _buildContentNone(S.current.dining_empty),
        _buildSection(S.current.home_sec_promo, isArabic, () {
          Navigator.pushNamed(context, RouteNames.offers);
        }),
        body.offers?.isNotEmpty == true
            ? _buildPromotions(body.offers!, isArabic)
            : _buildContentNone(S.current.offer_empty),
        // _promotions(),
        _buildSection(S.current.home_sec_event, isArabic, () {
          Navigator.pushNamed(context, RouteNames.events);
        }),
        body.events?.isNotEmpty == true
            ? _buildEvents(body.events!.reversed.toList(), isArabic)
            : _buildContentNone(S.current.event_empty),
      ],
    );
  }

  Widget _buildLoading(bool isArabic) {
    return Consumer(builder: (context, ref, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection(S.current.home_sec_category, isArabic, null),
          _buildContentLoading(),
          _buildSection(S.current.home_sec_brand, isArabic, null),
          _buildContentLoading(),
          _buildSection(S.current.home_sec_dining, isArabic, null),
          _buildContentLoading(),
          _buildSection(S.current.home_sec_promo, isArabic, null),
          _buildContentLoading(),
          _buildSection(S.current.home_sec_event, isArabic, null),
          _buildContentLoading(),
        ],
      );
    });
  }

  Widget _buildPromotions(List<Offers> list, bool isArabic) {
    // double ratio = (1.w / 1.h) * 1.3;
    double ratio = 0.5;
    return SizedBox(
      width: 100.w,
      height: 100.w * ratio,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: ratio,
          mainAxisSpacing: 1.h,
          crossAxisSpacing: 4.w,
        ),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.pushNamed(context, RouteNames.offerDetails,
              arguments: list[index]),
          child: _buildPromotionItem(
              list[index].ftImg ?? 'assets/images/promotion_sb.png',
              ratio,
              isArabic),
        ),
      ),
    );
  }

  Widget _buildPromotionItem(String image, double ratio, bool isArabic) {
    return Container(
      margin:
          isArabic ? EdgeInsets.only(left: 6.w) : EdgeInsets.only(right: 6.w),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(3.w)),
        child: Image(
          image: getImageProvider(image),
          // AssetImage('assets/images/promotion_sb.png'),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Widget _buildContentLoading() {
    double height = 30.w * 1.25;
    return SizedBox(
      height: height,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1.25,
          mainAxisSpacing: 4.w,
          crossAxisSpacing: 1.h,
        ),
        // padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        // physics: const NeverScrollableScrollPhysics(),
        itemCount: 9,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.all(1.w),
          child: SkeletonAnimation(
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      offset: Offset(0, 4),
                      color: Color(0x266D6D6D),
                    ),
                  ],
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(5)),
              width: double.infinity,
            ),
          ),
        ),
      ),
    );
    // double ratio = (1.w / 1.h) * 1.75;
    // return SizedBox(
    //   height: ratio * 200,
    //   child: GridView.builder(
    //     padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 1,
    //       childAspectRatio: 1 / ratio,
    //       mainAxisSpacing: 4.w,
    //       crossAxisSpacing: 1.h,
    //     ),
    //     // padding: const EdgeInsets.all(0),
    //     shrinkWrap: true,
    //     scrollDirection: Axis.horizontal,
    //     // physics: const NeverScrollableScrollPhysics(),
    //     itemCount: 3,
    //     itemBuilder: (context, index) => SkeletonAnimation(
    //       child: Container(
    //         decoration: BoxDecoration(
    //             boxShadow: const [
    //               BoxShadow(
    //                 blurRadius: 10,
    //                 offset: Offset(0, 4),
    //                 color: Color(0x266D6D6D),
    //               ),
    //             ],
    //             color: Colors.grey.shade400,
    //             borderRadius: BorderRadius.circular(5)),
    //         width: double.infinity,
    //       ),
    //     ),
    //   ),
    // );
  }

  Widget _buildContentNone(String placeHolder) {
    return SizedBox(
      height: 19.h,
      child: buildEmptyLoading(placeHolder),
    );
  }

  Widget _buildCategories(
      List<Categories> list, HomeBody homeBody, bool isArabic) {
    // double ratio = (1.w / 1.h) * 1.75;
    double height = 30.w * 1.2;
    // final value = list.map((e) => '${e.id}:${e.name!}').toList().join(' , ');

    // print('$value');
    return Consumer(builder: (context, ref, child) {
      return SizedBox(
        height: height,
        child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 1.2,
            mainAxisSpacing: 4.w,
            crossAxisSpacing: 1.h,
          ),
          // padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                final item = list[index];
                // final results = ref.watch(storesProvider);
                // switch (item.name) {
                //   case "SHOPPING":
                //     Navigator.pushNamed(context, RouteNames.searchResultCat,
                //         arguments: {
                //           'stores': results,
                //           'title': isArabic ? item.nameAr : item.name,
                //           'id': item.id
                //         });
                //     break;
                // }

                if (item.id == 2) {
                  final response = ref.read(diningProvider);
                  final List<Stores> results = response.value?.dinings ?? [];
                  if (results.isNotEmpty) {
                    Navigator.pushNamed(context, RouteNames.searchResultCat,
                        arguments: {
                          'stores': results,
                          'title': isArabic ? item.nameAr : item.name,
                          'id': item.id
                        });
                  } else {
                    Navigator.pushNamed(context, RouteNames.searchResultCat,
                        arguments: {
                          'stores': [],
                          'title': isArabic ? item.nameAr : item.name,
                          'id': item.id
                        });
                  }
                } else {
                  final response = ref.read(storesProvider);
                  final List<Stores> results = response.value?.stores
                          ?.where((element) =>
                              element.categoryId == item.id.toString())
                          .toList() ??
                      [];
                  if (results.isNotEmpty) {
                    Navigator.pushNamed(context, RouteNames.searchResultCat,
                        arguments: {
                          'stores': results,
                          'title': isArabic ? item.nameAr : item.name,
                          'id': item.id
                        });
                  } else {
                    Navigator.pushNamed(context, RouteNames.searchResultCat,
                        arguments: {
                          'stores': [],
                          'title': isArabic ? item.nameAr : item.name,
                          'id': item.id
                        });
                  }
                }
              },
              child: _buildRow(list[index], isArabic)),
        ),
      );
    });
  }

  Widget _buildRow(Categories category, bool isArabic) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3.w)),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0x26686868),
              blurRadius: 9,
              offset: Offset(0, 4),
            )
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          // Image(
          //     image: getImageProvider(
          //         categories[category.id] ?? 'cat_departmental.svg')),
          SvgPicture.asset(
            'assets/svg/${categoriesMap[category.id ?? 0] ?? 'cat_shop.svg'}',
            width: 12.w,
            fit: BoxFit.fitWidth,
          ),
          const Spacer(),
          Container(
            height: 0.7,
            color: const Color(0xFFECECEC),
          ),
          Container(
            height: 9.w,
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
            child: Text(
              (isArabic ? category.nameAr : category.name)?.toUpperCase() ?? '',
              textAlign: TextAlign.center,
              // overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: kFontFamily,
                color: Colors.black,
                fontSize: isArabic ? 9.sp : 7.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBrands(List<Stores> list, bool isArabic) {
    // double ratio = (1.w / 1.h) * 1.75;
    double height = 30.w * 1.25;
    return SizedBox(
      height: height,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1.25,
          mainAxisSpacing: 4.w,
          crossAxisSpacing: 1.h,
        ),
        // padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        // physics: const NeverScrollableScrollPhysics(),
        itemCount: list.length < 10 ? list.length : 10,
        itemBuilder: (context, index) =>
            _buildBrandCard(context, list[index], isArabic),
      ),
    );
    // double ratio = (1.w / 1.h) * 1.8;
    // return Container(
    //   // height: 20.h,
    //   padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 0.2.h),
    //   child: GridView.builder(
    //     shrinkWrap: true,
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 3,
    //       childAspectRatio: ratio,
    //       mainAxisSpacing: 1.h,
    //       crossAxisSpacing: 4.w,
    //     ),
    //     padding: const EdgeInsets.all(0),
    //     physics: const NeverScrollableScrollPhysics(),
    //     // scrollDirection: Axis.horizontal,
    //     itemCount: listBrandModels.length,
    //     itemBuilder: (context, index) =>
    //         _buildBrandCard(listBrandModels[index], () {
    //       Navigator.pushNamed(context, RouteNames.categories);
    //     }),
    //   ),
    // );
  }

  // "clang_option_english":"English",
  // "clang_option_arabic":"عربي",

  // Widget _getDiningCard() {
  //   return SizedBox(
  //     height: 20.h,
  //     child: Consumer(
  //       builder: (context, ref, child) {
  //         return ref.watch(diningProvider).when(
  //               data: (data) {
  //                 bool isArabic =
  //                     ref.watch(languageStateProvider) == langArabic;
  //                 if (data?.dinings?.isNotEmpty == true) {
  //                   return _buildDining(data!.dinings!, isArabic);
  //                 } else {
  //                   return buildEmptyLoading(S.current.dining_empty);
  //                 }
  //               },
  //               error: (error, stackTrace) =>
  //                   buildEmptyLoading(S.current.dining_error),
  //               loading: () => buildLoading,
  //             );
  //       },
  //     ),
  //   );
  // }

  // Widget _buildDining(List<Stores> list, bool isArabic) {
  //   double ratio = (1.w / 1.h) * 1.75;
  //   return SizedBox(
  //     height: ratio * 200,
  //     child: GridView.builder(
  //       padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 1,
  //         childAspectRatio: 1 / ratio,
  //         mainAxisSpacing: 4.w,
  //         crossAxisSpacing: 1.h,
  //       ),
  //       // padding: const EdgeInsets.all(0),
  //       shrinkWrap: true,
  //       scrollDirection: Axis.horizontal,
  //       // physics: const NeverScrollableScrollPhysics(),
  //       itemCount: list.length,
  //       itemBuilder: (context, index) => _buildDiningCard(
  //         context,
  //         list[index],
  //         isArabic,
  //       ),
  //     ),
  //   );
  // }

  Widget _buildEvents(List<Events> list, bool isArabic) {
    // double ratio = (1.h / 1.w);
    double height = 24.w * 1.7;

    return SizedBox(
      height: height + 7.w,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.w),
        shrinkWrap: false,
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) => Container(
            margin: isArabic
                ? EdgeInsets.only(left: 3.w)
                : EdgeInsets.only(right: 3.w),
            width: 30.w,
            height: height,
            child: GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, RouteNames.eventDetails,
                    arguments: list[index]),
                child: _buildEventCard(27.w, list[index], isArabic))),
      ),
    );
    // return Container(
    //   // height: 24.h,
    //   padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
    //   child: GridView.builder(
    //     shrinkWrap: true,
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 3,
    //       childAspectRatio: 0.56,
    //       mainAxisSpacing: 1.h,
    //       crossAxisSpacing: 3.w,
    //     ),
    //     padding: const EdgeInsets.all(0),
    //     physics: const NeverScrollableScrollPhysics(),
    //     // scrollDirection: Axis.horizontal,
    //     itemCount: listBrandModels.length,
    //     itemBuilder: (context, index) =>
    //         _buildEventCard(eventList[index], () {}),
    //   ),
    // );
  }

  Widget _buildBrandCard(BuildContext context, Stores model, bool isArabic) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouteNames.storeDetail, arguments: model);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(3.w)),
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              offset: Offset(0, 4),
              color: Color(0x266D6D6D),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(2.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Consumer(builder: (context, ref, child) {
              //   final isFav =
              //       ref.watch(favouriteStateProvider('dining_${model.id}'));
              //   return Align(
              //     alignment: Alignment.centerRight,
              //     child: GestureDetector(
              //       onTap: () async {
              //         ref
              //             .read(favouriteStateProvider('dining_${model.id}')
              //                 .notifier)
              //             .toggle();
              //       },
              //       child: SvgPicture.asset(
              //         isFav
              //             // model.wishlistInfo?.isNotEmpty ?? false
              //             ? 'assets/svg/icon_heart.svg'
              //             : 'assets/svg/icon_heart_unselect.svg',
              //         width: 3.5.w,
              //       ),
              //     ),
              //   );
              // }),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.w, horizontal: 1.w),
                  child: Image(
                    image: getImageProvider(model.logo ?? ''),
                    fit: BoxFit.contain,
                    width: 10.h,
                    height: 10.h,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//   Widget _buildDiningCard(BuildContext context, Stores model, bool isArabic) {
//     return InkWell(
//       onTap: () {
//         Navigator.pushNamed(context, RouteNames.storeDetail, arguments: model);
// //BuildContext context,
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.all(Radius.circular(3.w)),
//           boxShadow: const [
//             BoxShadow(
//               blurRadius: 10,
//               offset: Offset(0, 4),
//               color: Color(0x266D6D6D),
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: EdgeInsets.all(1.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               // SizedBox(height: 2.w),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   // SizedBox(width: 0.4.w),
//                   Padding(
//                     padding: EdgeInsets.only(top: 2.w, left: 1.w),
//                     child: Image(
//                       image: getImageProvider(model.logo ?? ''),
//                       fit: BoxFit.fitWidth,
//                       width: 4.5.h,
//                       height: 4.5.h,
//                     ),
//                   ),
//                   const Spacer(),

//                 ],
//               ),
//               SizedBox(height: 2.h),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 1.w),
//                 child: Text(
//                   (isArabic ? model.titleAr : model.title)?.toUpperCase() ?? '',
//                   // model.title?.toUpperCase() ?? '',
//                   maxLines: 1,
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 9.sp,
//                     fontWeight: FontWeight.w400,
//                     fontFamily: kFontFamily,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 1.w),
//                 child: Text(
//                   S.current.txt_floor(model.floor?.toUpperCase() ?? ''),
//                   // '${model.floor?.toUpperCase() ?? ''} Floor',
//                   style: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 7.sp,
//                     fontWeight: FontWeight.w300,
//                     fontFamily: kFontFamily,
//                   ),
//                 ),
//               ),
//               const Spacer(),
//               InkWell(
//                 onTap: () {
//                   String map = (isArabic ? model.mapAr : model.map) ?? '';
//                   if (map.isNotEmpty) {
//                     Navigator.pushNamed(context, RouteNames.navigateMap,
//                         arguments: map);
//                   }
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.all(6.0),
//                   decoration: BoxDecoration(
//                       color: AppColors.primaryColor,
//                       borderRadius: BorderRadius.vertical(
//                           bottom: Radius.circular(2.w),
//                           top: const Radius.circular(0))),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         S.current.btn_navigate.toUpperCase(),
//                         style: TextStyle(
//                           fontFamily: kFontFamily,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 6.sp,
//                         ),
//                       ),
//                       Icon(
//                         Icons.arrow_right_alt_sharp,
//                         color: Colors.white.withAlpha(180),
//                         size: 12.0,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               // const SizedBox(height: 5),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

  Widget _buildEventCard(double square, Events model, bool isArabic) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            offset: Offset(0, 4),
            color: Color(0x266D6D6D),
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(3.w),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image(
                image: getImageProvider(model.ftImg ?? ''),
                // 'assets/images/brands/${model.image}',
                width: square,
                height: square,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
            child: Text(
              (isArabic
                      ? model.titleAr?.toUpperCase()
                      : model.title?.toUpperCase()) ??
                  '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: 8.sp,
                fontWeight: FontWeight.w400,
                fontFamily: kFontFamily,
              ),
            ),
          ),
          const Spacer(),
          const Divider(height: 1, color: Color(0xFFCCCCCC)),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(
                  left: 3.w, right: 3.w, top: 0.3.h, bottom: 0.8.h),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.current.btn_explore.toUpperCase(),
                    style: TextStyle(
                      fontFamily: kFontFamily,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: isArabic ? 8.sp : 6.sp,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_right_alt_sharp,
                    color: Colors.black,
                    size: 12.0,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSection(String caption, bool isArabic, Function()? onViewAll) {
    return Padding(
      padding:
          EdgeInsets.only(left: 6.w, right: isArabic ? 6.w : 4.w, top: 0.5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                caption.toUpperCase(),
                style: homeCaptionStyle,
              ),
              Visibility(
                visible: onViewAll != null,
                child: TextButton(
                    onPressed: onViewAll,
                    child: Text(
                      S.current.btn_view_all.toUpperCase(),
                      style: homeViewAllStyle,
                    )),
              )
            ],
          )
        ],
      ),
    );
  }

  // _bottomNavigation() {
  //   return const BottomBar(currentIndex: 0);
  // }
  //   return Container(
  //     height: 18.w,
  //     padding: const EdgeInsets.all(10.0),
  //     margin: const EdgeInsets.only(bottom: 50, left: 30, right: 30),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       boxShadow: [
  //         BoxShadow(
  //             blurRadius: 10,
  //             offset: const Offset(-5, 5),
  //             color: Colors.black.withAlpha(0x0D)),
  //       ],
  //       borderRadius: const BorderRadius.all(
  //         Radius.circular(20.0),
  //       ),
  //     ),
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
  //       child: Row(
  //         mainAxisSize: MainAxisSize.max,
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           InkWell(onTap: () {}, child: _navItem('Home', 'nav_home.svg')),
  //           InkWell(onTap: () {}, child: _navItem('Dining', 'nav_dining.svg')),
  //           InkWell(onTap: () {}, child: _navItem('Stores', 'nav_store.svg')),
  //           InkWell(
  //               onTap: () {}, child: _navItem('Mall Map', 'nav_mall_map.svg')),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // _navItem(String label, String svgName) {
  //   return Column(
  //     mainAxisSize: MainAxisSize.max,
  //     children: [
  //       SvgPicture.asset(
  //         'assets/svg/$svgName',
  //         color: Colors.black,
  //         width: 24,
  //         height: 24,
  //         fit: BoxFit.cover,
  //       ),
  //       Text(
  //         label,
  //         style: const TextStyle(
  //           color: Colors.black,
  //           fontSize: 9,
  //           fontWeight: FontWeight.w500,
  //         ),
  //       )
  //     ],
  //   );
  // }

  // _buildTopBar() {
  //   return Stack(
  //     children: [
  //       Container(
  //         height: 35.h,
  //         decoration: const BoxDecoration(
  //           image: DecorationImage(
  //               image: AssetImage('assets/images/home_bg.png'),
  //               fit: BoxFit.cover),
  //         ),
  //       ),
  //       Column(
  //         children: [
  //           SizedBox(
  //             width: double.infinity,
  //             height: 35.h * 0.95,
  //             child: _topContent(),
  //           ),
  //           Container(
  //             width: 100.w,
  //             height: 2.h,
  //             padding: EdgeInsets.only(top: 2.h),
  //             decoration: BoxDecoration(
  //               color: AppColors.backgroundColor,
  //               boxShadow: [
  //                 BoxShadow(
  //                     blurRadius: 10,
  //                     offset: const Offset(-5, -5),
  //                     color: Colors.black.withAlpha(0x0D)),
  //               ],
  //               borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(5.w),
  //                 topRight: Radius.circular(5.w),
  //               ),
  //             ),
  //           )
  //         ],
  //       ),
  //     ],
  //   );
  // }

  Widget _topContent() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 6.h,
        ),
        // Container(
        //   width: 85.w,
        //   height: 6.h,
        //   padding: EdgeInsets.all(3.w),
        //   decoration: const BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.all(
        //       Radius.circular(8.0),
        //     ),
        //   ),
        //   child: Row(
        //     mainAxisSize: MainAxisSize.max,
        //     children: [
        //       const Icon(Icons.menu),
        //       SizedBox(
        //         width: 3.w,
        //       ),
        //       Image(
        //         width: 16.w,
        //         image: const AssetImage('assets/images/search_logo.png'),
        //         fit: BoxFit.fitWidth,
        //       ),
        //       const Spacer(),
        //       SvgPicture.asset(
        //         'assets/svg/search.svg',
        //         width: 6.w,
        //         fit: BoxFit.fitWidth,
        //       ),
        //       SizedBox(
        //         width: 1.w,
        //       ),
        //     ],
        //   ),
        // ),
        const Spacer(),
        Text(
          S.current.home_welcome.toUpperCase(),
          style: normalTextStyle.copyWith(
            color: Colors.white,
            fontSize: 11.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
        Text(
          S.current.home_mall.toUpperCase(),
          style: normalTextStyle.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 28.sp,
          ),
        ),
        SizedBox(height: 1.h),
      ],
    );
  }
}
