import '/data/models/response/home_response.dart';
import '/ui/widgets/common.dart';
import '/controller/dataproviders.dart';
import '/core/constants.dart';
import '/core/state.dart';
import '/core/ui_core.dart';
import '../../widgets/app_top_bar.dart';
import '../../widgets/bottom_bar.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopBarSearch(
                path: 'assets/images/Offer and promotion.jpg', index: -1),
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.only(left: 6.w, right: 6.w),
              child: Text(
                S.current.heading_offers,
                style: TextStyle(
                  fontFamily: kFontFamily,
                  color: Colors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Consumer(
              builder: (context, ref, child) {
                bool isArabic = ref.watch(languageStateProvider) == langArabic;
                return ref.watch(homeProvider).when(
                    data: (data) {
                      if (data?.offers?.isNotEmpty == true) {
                        return _buildOffers(context, data!.offers!, isArabic);
                      } else {
                        return buildEmptyLoading('No Offers');
                      }
                    },
                    error: (er, st) =>
                        buildEmptyLoading('Error while loading app'),
                    loading: () => buildLoading);
                // return Container();
              },
            ),
            SizedBox(height: 1.h),

            // const BottomBar(currentIndex: -1),
            // _bottomNavigation()
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(currentIndex: -1),
    );
  }

  Widget _buildOffers(BuildContext context, List<Offers> list, bool isArabic) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 1,
      //   childAspectRatio: 1.4,
      //   mainAxisSpacing: 1.h,
      //   crossAxisSpacing: 4.w,
      // ),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.pushNamed(context, RouteNames.offerDetails,
              arguments: list[index]),
          child: _buildPromotionItem(list[index], isArabic)),
    );
  }

  Widget _buildPromotionItem(Offers image, bool isArabic) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2.w)),
          color: AppColors.white),
      margin: EdgeInsets.only(bottom: 6.w),
      child: Column(
        children: [
          SizedBox(
            height: 42.w,
            width: 100.w,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(2.w)),
              child: Image(
                image: getImageProvider(
                    image.ftImg ?? 'assets/images/promotion_sb.png'),
                // AssetImage('assets/images/promotion_sb.png'),
                fit: BoxFit.fitWidth,
                height: 30.w,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(3.w),
            child: Row(
              children: [
                Text(
                  (isArabic ? image.titleAr : image.title) ?? '',
                  style: TextStyle(
                      fontFamily: kFontFamily,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                const Spacer(),
                Text(
                  S.current.btn_explore.toUpperCase(),
                  style: TextStyle(
                    fontFamily: kFontFamily,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 8.sp,
                  ),
                ),
                SizedBox(width: 2.w),
                const Icon(
                  Icons.arrow_right_alt_sharp,
                  color: Colors.black,
                  size: 12.0,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
