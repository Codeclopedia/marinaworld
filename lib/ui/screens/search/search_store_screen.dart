import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:grouped_scroll_view/grouped_scroll_view.dart';

import '/data/models/response/stores_response.dart';
import '../../widgets/common.dart';
import '/controller/dataproviders.dart';
import '/core/constants.dart';
import '/core/state.dart';
import '/core/ui_core.dart';
import '../../widgets/app_top_bar.dart';
import '../../widgets/bottom_bar.dart';

// ignore: must_be_immutable
class SearchStoreScreen extends HookWidget {
  SearchStoreScreen({Key? key}) : super(key: key);

  late TextEditingController _controller;
  @override
  Widget build(BuildContext context) {
    _controller = useTextEditingController();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBarSearch(
            path: 'assets/images/stores_bg.png',
            index: 1,
            otherView: Container(
              padding: EdgeInsets.only(top: 10.h),
              alignment: Alignment.bottomCenter,
              height: 28.h,
              child: _searchBar(),
            ),
          ),
          SizedBox(height: 2.h),
          Padding(
            padding: EdgeInsets.only(left: 6.w),
            child: Text(
              S.current.heading_search_result,
              style: TextStyle(
                fontFamily: kFontFamily,
                color: Colors.black,
                fontSize: 11.sp,
                fontWeight: FontWeight.w700,
              ),
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

  Widget _searchBar() {
    return Consumer(builder: (context, ref, child) {
      bool isArabic = ref.watch(languageStateProvider) == langArabic;

      return SizedBox(
        width: 85.w,
        child: TypeAheadField<Stores>(
          textFieldConfiguration: TextFieldConfiguration(
            autofocus: true,
            controller: _controller,
            onSubmitted: (value) {
              ref.read(searchInputProvider.notifier).state = value.trim();
            },
            decoration: searchInputDirectionStyle.copyWith(
              hintText: S.current.search_hint_name,
              contentPadding: const EdgeInsets.all(0),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 2.w, top: 3.5.w, bottom: 3.5.w),
                child: SvgPicture.asset('assets/svg/ic_search.svg', width: 2.w),
              ),
            ),
          ),
          noItemsFoundBuilder: (context) => const SizedBox.shrink(),
          suggestionsCallback: (pattern) async {
            return ref
                    .watch(searchSuggestionProvider(pattern.trim()))
                    .valueOrNull ??
                [];
          },
          suggestionsBoxDecoration: SuggestionsBoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3.w)),
            color: const Color(0xFFF5FCFF),
          ),
          itemBuilder: (context, suggestion) {
            return ListTile(
              leading: Image(
                image: getImageProvider(suggestion.logo ?? ''),
                width: 6.w,
              ),
              title: Text(
                  (isArabic ? suggestion.titleAr : suggestion.title) ?? ''),
              subtitle: Text(suggestion.locName ?? ''),
              trailing: const Icon(
                Icons.chevron_right,
                color: Colors.black,
              ),
            );
          },
          onSuggestionSelected: (suggestion) {
            Navigator.pushNamed(context, RouteNames.storeDetail,
                arguments: suggestion);
          },
        ),
        // padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.w),
        // child: TextField(
        //   decoration: searchInputDirectionStyle.copyWith(
        //     hintText: S.current.search_hint_name,
        //     contentPadding: const EdgeInsets.all(0),
        //     prefixIcon: Padding(
        //       padding: EdgeInsets.only(left: 2.w, top: 3.5.w, bottom: 3.5.w),
        //       child: SvgPicture.asset('assets/svg/ic_search.svg', width: 2.w),
        //     ),
        //   ),
        //   controller: _controller,
        //   onSubmitted: (value) {
        //     ref.read(searchInputProvider.notifier).state = value.trim();
        //     print('should  query $value');
        //   },
        // ),
      );
    });
  }

  Widget _buildBody() {
    return Consumer(builder: (context, ref, child) {
      bool isArabic = ref.watch(languageStateProvider) == langArabic;

      return ref.watch(searchProvider).when(
            data: (stores) {
              // print('stores ${stores.length}');
              if (stores.isNotEmpty == true) {
                return _buildGridView(stores, isArabic);
              } else {
                return buildEmptyLoading(S.current.placeholder_search_empty);
              }
            },
            error: (error, stackTrace) {
              // print('error $error');
              return buildEmptyLoading(S.current.stores_error);
            },
            loading: () => buildLoading,
          );

      // return results.isNotEmpty
      //     ? _buildGridView(results, isArabic)
      //     : buildEmptyLoading(S.current.placeholder_search_empty);
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
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: kFontFamily,
                  fontSize: 18,
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
