import 'package:flutter_svg/svg.dart';
import 'package:grouped_scroll_view/grouped_scroll_view.dart';
import 'package:skeleton_text/skeleton_text.dart';

import '/core/state.dart';

import '/controller/dataproviders.dart';
import '/core/constants.dart';
import '/core/ui_core.dart';
import '/data/models/response/stores_response.dart';
import '../../widgets/app_top_bar.dart';
import '../../widgets/bottom_bar.dart';
import '../../widgets/common.dart';

class HomeDiningScreen extends StatelessWidget {
  const HomeDiningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      // resizeToAvoidBottomInset: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopBarSearch(
            path: 'assets/images/Dinning-Banner.jpg',
            index: 1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.h),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  S.current.menu_dining.toUpperCase(),
                  style: TextStyle(
                    fontFamily: kFontFamily,
                    color: Colors.black,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.search);
                  },
                  child: Container(
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(1.2.w))),
                    child: SvgPicture.asset('assets/svg/ic_search.svg',
                        width: 3.8.w),
                  ),
                ),
                SizedBox(width: 2.w),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.searchDining);
                    // Navigator.pushNamed(context, RouteNames.categories);
                  },
                  child: Container(
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(1.2.w))),
                    child: SvgPicture.asset('assets/svg/icon_filter.svg',
                        width: 3.8.w),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                bool isArabic = ref.watch(languageStateProvider) == langArabic;
                return ref.watch(diningProvider).when(
                      data: (data) {
                        if (data?.dinings?.isNotEmpty == true) {
                          return _buildGridView(data!.dinings!, isArabic);
                        } else {
                          return buildEmptyLoading(S.current.dining_empty);
                        }
                      },
                      error: (error, stackTrace) =>
                          buildEmptyLoading(S.current.dining_error),
                      loading: () => _buildLoadingGrid(),
                    );
              },
            ),
          ),
          // _buildGrid(),
          SizedBox(height: 2.h),
          const BottomBar(currentIndex: 1),
        ],
      ),
      // bottomNavigationBar: const BottomBar(currentIndex: 1),
    );
  }

  Widget _buildGridView(List<Stores> list, bool isArabic) {
    list.sort(
      (a, b) => a.title!.compareTo(b.title!),
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: GroupedScrollView.grid(
        // physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        // itemsSorter: (a, b) => a.title!.compareTo(b.title!),
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // mainAxisSpacing: 5,
          // crossAxisSpacing: 5,
          // crossAxisCount: widget.crossAxisCount
          crossAxisCount: 3,
          childAspectRatio: 0.75,
          mainAxisSpacing: 0.5.h,
          crossAxisSpacing: 4.w,
        ),
        groupedOptions: GroupedScrollViewOptions(
          itemGrouper: (Stores store) {
            return store.title![0];
          },
          stickyHeaderBuilder:
              (BuildContext context, String alphabet, int groupedIndex) =>
                  Container(
            color: AppColors.backgroundColor,
            // height: 4.h,
            // decoration: BoxDecoration(
            //     color: AppColors.white,
            //     borderRadius: BorderRadius.all(Radius.circular(3.w))),
            // margin: EdgeInsets.only(bottom: 1.h),
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
            child: Text(
              alphabet,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: kFontFamily,
                  fontSize: 14.sp,
                  color: Colors.black),
            ),
          ),
        ),
        itemBuilder: (BuildContext context, Stores item) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RouteNames.storeDetail,
                  arguments: item);
            },
            child: _buildRow(
                (isArabic ? item.titleAr : item.title) ?? '', item.logo ?? ''),
          );
        },
        data: list,
        // headerBuilder: (BuildContext context) => Column(
        //   children: const [
        //     Divider(
        //       thickness: 5,
        //     ),
        //     Center(
        //       child: Text(
        //         'CustomHeader',
        //         style: TextStyle(fontWeight: FontWeight.bold),
        //       ),
        //     ),
        //     Divider(
        //       thickness: 5,
        //     ),
        //   ],
        // ),
        // footerBuilder: (BuildContext context) => Column(
        //   children: const [
        //     Divider(
        //       thickness: 5,
        //     ),
        //     Center(
        //       child: Text(
        //         'CustomFooter',
        //         style: TextStyle(fontWeight: FontWeight.bold),
        //       ),
        //     ),
        //     Divider(
        //       thickness: 5,
        //     ),
        //   ],
        // ),
      ),
    );
  }

  // _buildGrid(List<Stores> list, bool isArabic) {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
  //     child: GridView.builder(
  //       padding: const EdgeInsets.all(0),
  //       physics: const NeverScrollableScrollPhysics(),
  //       shrinkWrap: true,
  //       itemCount: list.length,
  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 3,
  //         childAspectRatio: 0.75,
  //         mainAxisSpacing: 0.5.h,
  //         crossAxisSpacing: 4.w,
  //       ),
  //       itemBuilder: (context, index) {
  //         final item = list[index];
  //         return GestureDetector(
  //           onTap: () {
  //             Navigator.pushNamed(context, RouteNames.storeDetail,
  //                 arguments: item);
  //           },
  //           child: _buildRow(
  //             (isArabic ? item.titleAr : item.title) ?? '',
  //             item.logo ?? '',
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  Widget _buildLoadingGrid() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
      child: GridView.builder(
        padding: const EdgeInsets.all(0),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 9,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.75,
          mainAxisSpacing: 0.5.h,
          crossAxisSpacing: 4.w,
        ),
        itemBuilder: (context, index) {
          return Column(
            children: [
              SkeletonAnimation(
                child: Container(
                  height: 24.w,
                  width: 24.w,
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
                ),
              ),
              SizedBox(
                height: 5.h,
                child: SkeletonAnimation(
                  child: const Text('- - - - - '),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildRow(String title, String image) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 24.w,
          width: 24.w,
          padding: EdgeInsets.all(4.w),
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
          child: Image(
            image: getImageProvider(image),
            fit: BoxFit.fitWidth,
          ),
        ),
        // const Spacer(),
        SizedBox(height: 1.2.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Text(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: storeTextStyle,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
