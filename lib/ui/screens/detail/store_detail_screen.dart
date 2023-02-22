import 'dart:convert';

import 'package:flutter_svg/flutter_svg.dart';

import '../../../controller/authproviders.dart';
import '/controller/dataproviders.dart';
import '/core/state.dart';
import '/core/constants.dart';
import '/core/ui_core.dart';

import '/ui/widgets/common.dart';
import '/data/models/response/stores_response.dart';
import '../../widgets/app_top_bar.dart';
import '../../widgets/bottom_bar.dart';

class StoreDetailScreen extends StatelessWidget {
  final Stores store;
  const StoreDetailScreen({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String path = store.coverImage?.isNotEmpty == true
        ? store.coverImage!
        : 'assets/images/store_detail_bg.png';

    if (store.gallery != null) {
      final list = jsonDecode(store.gallery ?? "");
      if (list is List && list.isNotEmpty) {
        // final lst = list;
        dynamic local = list[0];
        // print('local $path');
        if (local?.toString() != null) {
          path = local.toString();
        }
        // print('path $path');
        // print('List Stores:${store.gallery}');
      }
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TopBarSearch(
                    path: path,
                    topBarHeight: 40.h,
                    index: 2,
                    otherView: _buildLogo(),
                    bgColor: AppColors.backgroundColor,
                  ),
                  _buildContent(context),
                  // Flexible(
                  //   // child: SingleChildScrollView(
                  //   child: _buildContent(context),
                  //   // ),
                  // ),
                  // SizedBox(height: 2.h),
                  // Container(
                  //     color: Colors.white, child: const BottomBar(currentIndex: -1)),
                ],
              ),
            ),
          ),
          // Container(
          //     color: Colors.white, child: const BottomBar(currentIndex: -1)),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: const BottomBar(currentIndex: -1),
      ),
    );
  }

  Widget _buildLogo() {
    return Positioned(
      top: 28.h,
      left: 8.w,
      right: 6.w,
      child: SizedBox(
        width: 90.w,
        height: 12.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 6.h,
              child: Image(
                image: getImageProvider(store.logo ?? ''),
                width: 6.h,
                height: 6.h,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: 1.h, left: 4.w, right: 4.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Consumer(builder: (context, ref, child) {
                      bool isArabic =
                          ref.watch(languageStateProvider) == langArabic;
                      return Expanded(
                        child: Text(
                          isArabic ? store.titleAr ?? "" : store.title ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: kFontFamily,
                            color: Colors.black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      );
                    }),
                    //Added sizedbox as this widget is used as stack and we can't use spacebetween
                    // Spacer(),
                    // Consumer(builder: (context, ref, child) {
                    //   final isFav = ref
                    //       .watch(favouriteStateProvider('dining_${store.id}'));
                    //   // final user = ref.watch(authDataSourceProvider).getUser();
                    //   return GestureDetector(
                    //     onTap: () async {
                    //       //for later
                    //       // user == null
                    //       //     ? ref
                    //       //         .read(favouriteStateProvider(
                    //       //                 'dining_${store.id}')
                    //       //             .notifier)
                    //       //         .toggle()
                    //       //     : {};
                    //       ref
                    //           .read(favouriteStateProvider('dining_${store.id}')
                    //               .notifier)
                    //           .toggle();
                    //     },
                    //     child: SvgPicture.asset(
                    //       isFav
                    //           // store.wishlistInfo?.isNotEmpty ?? false
                    //           ? 'assets/svg/icon_heart.svg'
                    //           : 'assets/svg/icon_heart_unselect.svg',
                    //       width: 6.w,
                    //     ),
                    //   );
                    // }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      bool isArabic = ref.watch(languageStateProvider) == langArabic;
      final desc = isArabic ? store.descriptionAr : store.description;
      final address = isArabic
          ? "${store.addressAr}, ${store.floor}"
          : "${store.address}, ${store.floor}";
      return Container(
        width: 100.w,

        // margin: EdgeInsets.only(top: 1.h),
        padding: EdgeInsets.only(top: 4.h, left: 6.w, right: 6.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                offset: const Offset(-5, -5),
                color: Colors.black.withAlpha(0x0D)),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6.w),
            topRight: Radius.circular(6.w),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRow('icon_info.svg',
                isArabic ? store.titleAr ?? "" : store.title ?? "", isArabic),
            const SizedBox(height: 2),
            _buildDesc(desc ?? ''),
            SizedBox(height: 2.h),
            _buildRowClock('icon_timing.svg', S.current.dtl_opening, isArabic),
            const SizedBox(height: 5),
            _buildDesc(
                S.current.dtl_weekday(
                    isArabic
                        ? store.weekdayOpening?.replaceAll("AM", "صباحاً") ?? ""
                        : store.weekdayOpening ?? '',
                    isArabic
                        ? store.weekdayClosing?.replaceAll("PM", "مساءً") ?? ""
                        : store.weekdayClosing ?? ''),
                left: 7.w),
            // 'Weekday: ${dining.weekdayOpening} - ${dining.weekdayClosing}'),
            _buildDesc(
                S.current.dtl_weekend(
                    isArabic
                        ? store.weekendOpening?.replaceAll("AM", "صباحاً") ?? ""
                        : store.weekendOpening ?? '',
                    isArabic
                        ? store.weekendClosing?.replaceAll("PM", "مساءً") ?? ""
                        : store.weekendClosing ?? ''),
                left: 7.w),
            // 'Weekend: ${dining.weekendOpening} - ${dining.weekendClosing}'),
            SizedBox(height: 2.h),
            if (address.toString().isNotEmpty == true)
              _buildRow('icon_map_pin.svg', S.current.dtl_location, isArabic),
            if (address.toString().isNotEmpty == true)
              const SizedBox(height: 4),
            if (address.toString().isNotEmpty == true)
              _buildDesc(address.toString()),
            SizedBox(height: 2.h),
            if (store.telephoneNumber?.isNotEmpty == true)
              _buildRow('icon_call.svg', S.current.dtl_number, isArabic),
            if (store.telephoneNumber?.isNotEmpty == true)
              const SizedBox(height: 5),
            if (store.telephoneNumber?.isNotEmpty == true)
              _buildDesc(store.telephoneNumber ?? ''),
            SizedBox(height: 3.h),
            Center(
              child: SizedBox(
                  width: 80.w,
                  child: ElevatedButton(
                      style: elevatedButtonTextStyle,
                      onPressed: () {
                        String map = (isArabic ? store.mapAr : store.map) ?? '';
                        if (map.isNotEmpty) {
                          Navigator.pushNamed(context, RouteNames.navigateMap,
                              arguments: map);
                        } else {
                          Navigator.pushNamed(context,
                              isArabic ? RouteNames.mapAr : RouteNames.map);
                        }
                        //
                      },
                      child: Text(S.current.btn_navigate))),
            ),
            SizedBox(height: 3.h),
          ],
        ),
        // child: otherView ?? SizedBox.shrink(),
      );
    });
  }
  // Widget _buildContent(BuildContext context) => Container(
  //       width: 100.w,
  //       // margin: EdgeInsets.only(top: 1.h),
  //       padding: EdgeInsets.only(top: 4.h, left: 6.w, right: 6.w),
  //       decoration: BoxDecoration(
  //         color: AppColors.white,
  //         boxShadow: [
  //           BoxShadow(
  //               blurRadius: 10,
  //               offset: const Offset(-5, -5),
  //               color: Colors.black.withAlpha(0x0D)),
  //         ],
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(6.w),
  //           topRight: Radius.circular(6.w),
  //         ),
  //       ),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           _buildRow('icon_info.svg', S.current.dtl_about),
  //           const SizedBox(height: 2),
  //           _buildDesc(store.description ?? ''),
  //           SizedBox(height: 2.h),
  //           _buildRow('icon_timing.svg', S.current.dtl_opening),
  //           const SizedBox(height: 5),
  //           _buildDesc(
  //             S.current.dtl_weekday(
  //                 store.weekdayOpening ?? '', store.weekdayClosing ?? ''),
  //           ),
  //           // 'Weekday: ${dining.weekdayOpening} - ${dining.weekdayClosing}'),
  //           _buildDesc(S.current.dtl_weekend(
  //               store.weekendOpening ?? '', store.weekendClosing ?? '')),
  //           // 'Weekend: ${dining.weekendOpening} - ${dining.weekendClosing}'),
  //           SizedBox(height: 2.h),
  //           if (store.address?.isNotEmpty == true)
  //             _buildRow('icon_map_pin.svg', S.current.dtl_location),
  //           if (store.address?.isNotEmpty == true) const SizedBox(height: 4),
  //           if (store.address?.isNotEmpty == true)
  //             _buildDesc(store.address ?? ''),
  //           SizedBox(
  //             height: 2.h,
  //           ),
  //           if (store.telephoneNumber?.isNotEmpty == true)
  //             _buildRow('icon_call.svg', S.current.dtl_number),
  //           if (store.telephoneNumber?.isNotEmpty == true)
  //             const SizedBox(height: 5),
  //           if (store.telephoneNumber?.isNotEmpty == true)
  //             _buildDesc(store.telephoneNumber ?? ''),
  //           SizedBox(
  //             height: 3.h,
  //           ),
  //           Center(
  //             child: SizedBox(
  //                 width: 80.w,
  //                 child: ElevatedButton(
  //                     style: elevatedButtonTextStyle,
  //                     onPressed: () {
  //                       Navigator.pushNamed(context, RouteNames.map);
  //                     },
  //                     child: Text(S.current.btn_navigate))),
  //           )
  //         ],
  //       ),
  //       // child: otherView ?? SizedBox.shrink(),
  //     );

  Widget _buildRow(String icon, String caption, bool isArabic) {
    return Row(
      children: [
        SvgPicture.asset('assets/svg/$icon', width: 4.w),
        SizedBox(width: 3.w),
        Text(
          caption.toUpperCase(),
          style: TextStyle(
              fontFamily: kFontFamily,
              fontSize: isArabic ? 12.sp : 11.sp,
              fontWeight: isArabic ? FontWeight.w600 : FontWeight.w500,
              color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildRowClock(String icon, String caption, bool isArabic) {
    return Row(
      children: [
        SvgPicture.asset('assets/svg/$icon', width: 3.w),
        SizedBox(width: 4.w),
        Text(
          caption.toUpperCase(),
          style: TextStyle(
              fontFamily: kFontFamily,
              fontSize: isArabic ? 12.sp : 11.sp,
              fontWeight: isArabic ? FontWeight.w600 : FontWeight.w500,
              color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildDesc(String desc, {double? left}) {
    return Consumer(builder: (context, ref, child) {
      bool isArabic = ref.watch(languageStateProvider) == langArabic;
      return Padding(
        padding: EdgeInsets.only(
          left: left ?? 7.w,
          right: 8.w,
        ),
        child: Text(
          desc,
          style: TextStyle(
            fontFamily: kFontFamily,
            fontSize: isArabic ? 10.sp : 8.sp,
            fontWeight: FontWeight.w300,
            color: const Color(0xFF4B4B4B),
          ),
        ),
      );
    });
  }
}
