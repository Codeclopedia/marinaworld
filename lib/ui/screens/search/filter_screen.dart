import 'dart:math';

import 'package:flutter_svg/svg.dart';
import '/controller/dataproviders.dart';
import '/core/state.dart';
import '/data/models/response/stores_response.dart';
import '/ui/widgets/common.dart';

import '../../widgets/app_top_bar.dart';
import '../../widgets/bottom_bar.dart';
import '/core/constants.dart';
import '/core/ui_core.dart';

final selectedCategories =
    StateProvider.autoDispose<Categories?>((ref) => null);
final selectedLocations = StateProvider.autoDispose<Locations?>((ref) => null);
// final selectedStore = StateProvider.autoDispose<Stores?>((ref) => null);
final selectedFloor = StateProvider.autoDispose<String?>((ref) => null);
// final selectedFloorApiData = StateProvider<String?>((ref) => null);
// final searchParam = StateProvider.autoDispose<String>((ref) => '');

class SearchFilterScreen extends StatelessWidget {
  final bool isDining;
  // late TextEditingController _controller;
  const SearchFilterScreen({Key? key, this.isDining = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // _controller = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopBarSearch(
            bgColor: AppColors.white,
            path: 'assets/images/locate_top_bg.png',
            index: 1,
          ),
          SizedBox(height: 2.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 6.w,
              ),
              child: _buildBody(),
            ),
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
      // final isArabic = ref.read(languageStateProvider);
      if (isDining) {
        return ref.watch(diningProvider).when(
            data: (data) {
              if (data == null) {
                return const SizedBox.shrink();
              }
              final List<Categories> cats = (data.categories
                      ?.where((element) => (element.id ?? 0) == 2))?.toList() ??
                  [];
              final List<Locations> locations = data.locations ?? [];
              final List<String> floor =
                  (data.dinings?.map((e) => e.floor.toString()).toSet() ?? {})
                      .toList();

              return _buildSearchParams(
                  context, ref, cats, locations, floor, data.dinings ?? []);
            },
            error: (e, t) => buildEmptyLoading('Error while loading'),
            loading: () => buildLoading);
      }

      return ref.watch(storesProvider).when(
          data: (data) {
            if (data == null) {
              return const SizedBox.shrink();
            }
            final List<Categories> cats = (data.categories
                    ?.where((element) => (element.id ?? 0) != 2))?.toList() ??
                [];
            final List<Locations> locations = data.locations ?? [];
            final List<String> floors =
                (data.stores?.map((e) => e.floor.toString()).toSet() ?? {})
                    .toList();
            // final List<String> floor = [];
            // floors.every(
            //   (element) {
            //     element == "All Floors" || element == null
            //         ? floor.add(S.current.search_all_flr)
            //         : element == "ground"
            //             ? floor.add(S.current.floor_ground)
            //             : element == "1st"
            //                 ? floor.add(S.current.floor_first)
            //                 : element == "2nd"
            //                     ? floor.add(S.current.floor_second)
            //                     : null;
            //     return true;
            //   },
            // );
            return _buildSearchParams(
                context, ref, cats, locations, floors, data.stores ?? []);
            // final selectedCat = ref.watch(selectedCategories);
          },
          error: (e, t) => buildEmptyLoading('Error while loading'),
          loading: () => buildLoading);
    });
  }

  Widget _buildSearchParams(
      BuildContext context,
      WidgetRef ref,
      final List<Categories> cats,
      final List<Locations> locations,
      final List<String> floors,
      List<Stores> stores) {
    // final selectedStr = ref.watch(selectedStore);
    final selectedCat = ref.watch(selectedCategories);
    final selectedLoc = ref.watch(selectedLocations);
    final selectedFlr = ref.watch(selectedFloor);
    bool isArabic = ref.watch(languageStateProvider) == langArabic;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          isDining
              ? S.current.heading_search_dinig
              : S.current.heading_search_store,
          style: TextStyle(
            fontSize: 13.sp,
            fontFamily: kFontFamily,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 6.w),
        // TextField(
        //   controller: _controller,
        //   decoration: searchInputDirectionStyle.copyWith(
        //     hintText: 'Search by name',
        //     suffixIcon: Padding(
        //       padding: EdgeInsets.only(right: 4.w, top: 2.5.w, bottom: 2.5.w),
        //       child: SvgPicture.asset('assets/svg/ic_search.svg', width: 3.w),
        //     ),
        //   ),
        // ),

        // _buildStoresDropDown(isArabic, [null, ...stores], selectedStr,
        //     (v) => ref.read(selectedStore.notifier).state = v),

        // SizedBox(height: 4.w),
        _buildCategoriesDropDown(isArabic, [null, ...cats], selectedCat,
            (v) => ref.read(selectedCategories.notifier).state = v),
        SizedBox(height: 4.w),
        _buildFloorDropDown(isArabic, [null, ...floors], selectedFlr, (v) {
          // String value = v == S.current.search_all_flr
          //     ? "All Floors"
          //     : v == S.current.floor_ground
          //         ? "ground"
          //         : v == S.current.floor_first
          //             ? "1st"
          //             : v == S.current.floor_second
          //                 ? "2nd"
          //                 : "";

          ref.read(selectedFloor.notifier).state = v;
          // ref.read(selectedFloorApiData.notifier).state = value;
          // print(ref.watch(selectedFloorApiData));
        }),
        SizedBox(height: 4.w),
        _buildLocationsDropDown(isArabic, [null, ...locations], selectedLoc,
            (v) => ref.read(selectedLocations.notifier).state = v),
        SizedBox(height: 6.w),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              style: elevatedButtonTextStyle,
              onPressed: () {
                // String term = _controller.text.trim();
                // term,

                final result = _doFilter(context, isArabic, selectedCat,
                    selectedLoc, ref.watch(selectedFloor), stores);
                isDining
                    ? Navigator.pushNamed(context, RouteNames.searchResultCat,
                        arguments: {
                            'stores': result,
                            'title': S.current.heading_search_result,
                            'id': 2
                          })
                    : Navigator.pushNamed(context, RouteNames.searchResult,
                        arguments: result);
                // _goHome(context, ref);
              },
              child: Text(S.current.clang_btn_submit)),
        )
      ],
    );
  }

  List<Stores> _doFilter(
      BuildContext context,
      bool isArabic,
      //String term,
      Categories? cat,
      Locations? loc,
      String? floor,
      List<Stores> stores) {
    return stores.where(
      (element) {
        bool pred = true;
        // if (term.isNotEmpty) {
        //   if (isArabic && element.titleAr?.isNotEmpty == true) {
        //     pred = (element.titleAr ?? '')
        //         .toLowerCase()
        //         .contains(term.toLowerCase());
        //   } else if (element.title?.isNotEmpty == true) {
        //     pred = (element.title ?? '')
        //         .toLowerCase()
        //         .contains(term.toLowerCase());
        //   }
        // }
        if (cat?.id != null) {
          pred = (element.categoryId ?? '') == cat!.id.toString();
        }

        if (loc?.name?.isNotEmpty == true && pred) {
          pred = (element.locName ?? '') == (loc!.name);
        }
        if (floor != null && pred) {
          pred = (element.floor ?? '') == floor;
        }
        return pred;
      },
    ).toList();
  }

  Widget buildStoresDropDown(bool isArabic, List<Stores?> options,
      Stores? value, Function(Stores?) onChanged) {
    return Container(
      height: 12.w,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(right: 2.w),
      decoration: BoxDecoration(
        color: AppColors.greyBox.withAlpha(90),
        borderRadius: BorderRadius.all(Radius.circular(2.w)),
      ),
      child: DropdownButton<Stores>(
        underline: const SizedBox.shrink(),
        onTap: () {},
        items: options.map<DropdownMenuItem<Stores>>((Stores? value) {
          return DropdownMenuItem<Stores>(
            value: value,
            child: Padding(
              padding: EdgeInsets.only(left: 3.w),
              child: Text(
                  //isArabic
                  value?.title ?? ''),
            ),
          );
        }).toList(),
        value: value,
        onChanged: onChanged,
        isExpanded: true,
        iconSize: 12.w,
        icon: Padding(
          padding: EdgeInsets.all(2.w),
          child: SvgPicture.asset('assets/svg/ic_search.svg', width: 5.w),
        ),
        dropdownColor: const Color(0xFFF5FCFF),
        hint: Container(
          // width: 75.w,
          // width: double.infinity,
          padding: EdgeInsets.only(left: 2.w),
          child: Text(
            S.current.search_hint_name,
            style: hintTextStyle,
          ),
        ),
      ),
    );
  }

  Widget _buildFloorDropDown(bool isArabic, List<String?> options,
      String? value, Function(String?) onChanged) {
    return Container(
      height: 12.w,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: AppColors.greyBox.withAlpha(90),
        borderRadius: BorderRadius.all(Radius.circular(2.w)),
      ),
      child: DropdownButton<String>(
        underline: const SizedBox.shrink(),
        onTap: () {},
        items: options.map<DropdownMenuItem<String>>((String? value) {
          String updateFloorTitle = value == "All Floors" || value == null
              ? S.current.search_all_flr
              : value == "ground"
                  ? S.current.floor_ground
                  : value == "1st"
                      ? S.current.floor_first
                      : value == "2nd"
                          ? S.current.floor_second
                          : "";
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: EdgeInsets.only(left: 3.w),
              child: Text(
                  //isArabic
                  updateFloorTitle),
            ),
          );
        }).toList(),
        value: value,
        onChanged: onChanged,
        isExpanded: true,
        iconSize: 8.w,
        icon: Padding(
          padding: EdgeInsets.all(2.w),
          child: const Icon(
            Icons.arrow_drop_down,
            color: AppColors.primaryColor,
          ),
        ),
        dropdownColor: const Color(0xFFF5FCFF),
        hint: Container(
          // width: 75.w,
          // width: double.infinity,
          padding: EdgeInsets.only(left: 2.w),
          child: Text(
            S.current.search_all_flr,
            style: hintTextStyle,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoriesDropDown(bool isArabic, List<Categories?> options,
      Categories? value, Function(Categories?) onChanged) {
    return Container(
      height: 12.w,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: AppColors.greyBox.withAlpha(90),
        borderRadius: BorderRadius.all(Radius.circular(2.w)),
      ),
      child: DropdownButton<Categories>(
        underline: const SizedBox.shrink(),
        onTap: () {},
        items: options.map<DropdownMenuItem<Categories>>((Categories? value) {
          return DropdownMenuItem<Categories>(
            value: value,
            child: Padding(
              padding: EdgeInsets.only(left: 3.w),
              child: Text((isArabic ? value?.nameAr : value?.name) ??
                  S.current.search_all_cat),
            ),
          );
        }).toList(),
        value: value,
        onChanged: onChanged,
        isExpanded: true,
        iconSize: 8.w,
        icon: Padding(
          padding: EdgeInsets.all(2.w),
          child: const Icon(
            Icons.arrow_drop_down,
            color: AppColors.primaryColor,
          ),
        ),
        dropdownColor: const Color(0xFFF5FCFF),
        hint: Container(
          // width: 75.w,
          // width: double.infinity,
          padding: EdgeInsets.only(left: 2.w),
          child: Text(
            S.current.search_all_cat,
            style: hintTextStyle,
          ),
        ),
      ),
    );
  }

  Widget _buildLocationsDropDown(bool isArabic, List<Locations?> options,
      Locations? value, Function(Locations?) onChanged) {
    return Container(
      height: 12.w,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: AppColors.greyBox.withAlpha(90),
        borderRadius: BorderRadius.all(Radius.circular(2.w)),
      ),
      child: DropdownButton<Locations>(
        underline: const SizedBox.shrink(),
        onTap: () {},
        items: options.map<DropdownMenuItem<Locations>>((Locations? value) {
          return DropdownMenuItem<Locations>(
            value: value,
            child: Padding(
              padding: EdgeInsets.only(left: 3.w),
              child: Text((isArabic ? value?.nameAr : value?.name) ??
                  S.current.search_all_loc),
            ),
          );
        }).toList(),
        value: value,
        onChanged: onChanged,
        isExpanded: true,
        iconSize: 8.w,
        icon: Padding(
          padding: EdgeInsets.all(2.w),
          child: const Icon(
            Icons.arrow_drop_down,
            color: AppColors.primaryColor,
          ),
        ),
        dropdownColor: const Color(0xFFF5FCFF),
        hint: Container(
          // width: 75.w,
          // width: double.infinity,
          padding: EdgeInsets.only(left: 2.w),
          child: Text(
            S.current.search_all_loc,
            style: hintTextStyle,
          ),
        ),
      ),
    );
  }
}
