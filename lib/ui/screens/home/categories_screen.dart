import 'package:flutter_svg/flutter_svg.dart';
import '/controller/dataproviders.dart';
import '/core/state.dart';
// import 'package:marina_mall/data/models/response/home_response.dart';
// import 'package:marina_mall/data/models/response/stores_response.dart';
import '/ui/widgets/common.dart';

import '../../../core/constants.dart';
import '../../../core/ui_core.dart';
import '../../../data/models/models.dart';
import '../../widgets/app_top_bar.dart';
import '../../widgets/bottom_bar.dart';

final categoriesMap = <int, String>{
  1: 'cat_shop.svg',
  2: 'cat_dining.svg',
  3: 'cat_entertainment.svg',
  4: 'cat_banking.svg',
  5: 'cat_communication.svg',
  6: 'cat_healthcare.svg',
  7: 'cat_technology.svg',
  8: 'cat_hotel.svg',
  9: 'cat_office.svg',
};

// final categories = <String, String>{
//   'APPAREL': 'cat_clothes.svg',
//   'BEAUTY & COSMETICS': 'cat_makeup.svg',
//   'BANKS & FINANCIAL SERVICES': 'cat_banking.svg',
//   'DEPARTMENT STORE': 'cat_departmental.svg',
//   'ELECTRONICS': 'cat_electronics.svg',
//   'GIFT & ANTIQUES': 'cat_gifts.svg',
//   'HOME & FURNITURES': 'cat_furniture.svg',
//   'OPTICALS': 'cat_optical.svg',
//   'PHARMACY': 'cat_pharma.svg',
// };

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopBarSearch(
              path: 'assets/images/categories_bg.png',
              index: -1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
              child: Text(
                S.current.txt_categories.toUpperCase(),
                style: TextStyle(
                  fontFamily: kFontFamily,
                  color: Colors.black,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                bool isArabic = ref.watch(languageStateProvider) == langArabic;

                return ref.watch(homeProvider).when(
                    data: (data) {
                      if (data?.categories?.isNotEmpty == true) {
                        return _buildGrid(data!, ref, isArabic);
                      }
                      return buildEmptyLoading('message');
                    },
                    error: (e, t) => buildEmptyLoading('message'),
                    loading: () => buildLoading);
              },
            ),
            SizedBox(height: 2.h),
            // const BottomBar(currentIndex: -1),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(currentIndex: -1),
    );
  }

  _buildGrid(HomeBody homeBody, WidgetRef ref, bool isArabic) {
    List<Categories> categories = homeBody.categories!;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
      child: GridView.builder(
        padding: const EdgeInsets.all(0),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.8,
          mainAxisSpacing: 2.h,
          crossAxisSpacing: 6.w,
        ),
        itemBuilder: (context, index) {
          final item = categories[index];
          String icon = categoriesMap[item.id ?? 0] ?? 'cat_shop.svg';
          return GestureDetector(
            onTap: () {
              if (item.id == 2) {
                final List<Stores> results = homeBody.dinings ?? [];
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
                final List<Stores> results = (homeBody.stores
                        ?.where((element) =>
                            element.categoryId == item.id.toString())
                        .toList()) ??
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
            child: _buildRow((isArabic ? item.nameAr : item.name) ?? '', icon),
          );
        },
      ),
    );
  }

  Widget _buildRow(String title, String image) {
    return Container(
      clipBehavior: Clip.none,
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
          SvgPicture.asset(
            'assets/svg/$image',
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
              title.toUpperCase(),
              maxLines: 1,
              textAlign: TextAlign.center,
              // overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: kFontFamily,
                color: Colors.black,
                fontSize: 6.5.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
