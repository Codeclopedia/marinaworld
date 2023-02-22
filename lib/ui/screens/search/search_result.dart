import 'package:flutter_svg/svg.dart';
import 'package:grouped_scroll_view/grouped_scroll_view.dart';

import '/data/models/response/stores_response.dart';
import '../../widgets/common.dart';
import '/controller/dataproviders.dart';
import '/core/constants.dart';
import '/core/state.dart';
import '../../widgets/app_top_bar.dart';
import '../../widgets/bottom_bar.dart';
import '/core/ui_core.dart';

class SearchResultScreen extends StatelessWidget {
  final List<Stores> results;
  final String? title;
  final int? id;

  const SearchResultScreen(
      {Key? key, required this.results, this.title, this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopBarSearch(
            path: 'assets/images/stores_bg.png',
            index: 1,
          ),
          SizedBox(height: 2.h),
          // Padding(
          //   padding: EdgeInsets.only(left: 6.w),
          //   child: Text(
          //     title ?? S.current.heading_search_result,
          //     style: const TextStyle(
          //       fontFamily: kFontFamily,
          //       color: Colors.black,
          //       fontSize: 14,
          //       fontWeight: FontWeight.w700,
          //     ),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.h),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  title ?? S.current.heading_search_result,
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
                    Navigator.pushNamed(
                        context,
                        id == 2
                            ? RouteNames.searchDining
                            : RouteNames.searchStore);
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
            child: _buildBody(),
          ),
          SizedBox(height: 4.w),
          // const BottomBar(currentIndex: -1),
        ],
      ),
      bottomNavigationBar: const BottomBar(currentIndex: -1),
    );
  }

  Widget _buildBody() {
    return Consumer(builder: (context, ref, child) {
      bool isArabic = ref.watch(languageStateProvider) == langArabic;
      return results.isNotEmpty
          ? _buildGridView(results, isArabic)
          : buildEmptyLoading(S.current.placeholder_search_empty);
    });
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
      ),
    );
  }

  Widget _buildRow(String title, String image) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // const Spacer(),
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
            // 'assets/images/brands/$image',

            fit: BoxFit.fitWidth,
          ),
        ),
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
