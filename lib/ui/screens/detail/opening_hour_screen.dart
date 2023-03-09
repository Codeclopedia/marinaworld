import '/core/constants.dart';
import '/core/ui_core.dart';
import '../../widgets/app_top_bar.dart';
import '../../widgets/bottom_bar.dart';

class OpeningHourScreen extends StatelessWidget {
  const OpeningHourScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const TopBarSearch(
            path: 'assets/images/opening_bg.png',
            index: -1,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.current.menu_opening_hr.toUpperCase(),
                    style: TextStyle(
                      fontFamily: kFontFamily,
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  _buildField('icon_retailer.png', S.current.oh_retailer,
                      "${S.current.oh_retailer_time_part_1} \n ${S.current.oh_retailer_time_part_2}"),
                  SizedBox(height: 4.h),
                  _buildField('icon_movie.png', S.current.oh_movie,
                      '${S.current.oh_movie_time_part_2} ${S.current.oh_movie_time_part_1}'),
                  SizedBox(height: 4.h),
                  _buildField('icon_food.png', S.current.oh_rest,
                      S.current.oh_rest_time),
                  SizedBox(height: 4.h),
                  _buildField('icon_resturant.png', S.current.oh_hotel,
                      S.current.oh_hotel_time),
                  SizedBox(height: 1.h),
                ],
              ),
            ),
          ))
        ],
      ),
      bottomNavigationBar: const BottomBar(currentIndex: -1),
    );
  }

  Widget _buildField(String icon, String title, String desc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/$icon',
          width: 8.5.w,
          fit: BoxFit.fitWidth,
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontFamily: kFontFamily,
                    color: Colors.black,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 0.8.w),
              Text(
                desc,
                style: TextStyle(
                    fontFamily: kFontFamily,
                    color: const Color(0xFF4b4b4b),
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildField2(String icon, String title, String desc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/$icon',
          width: 8.5.w,
          fit: BoxFit.fitWidth,
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontFamily: kFontFamily,
                    color: Colors.black,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 0.8.w),
              Text(
                desc,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    fontFamily: kFontFamily,
                    color: const Color(0xFF4b4b4b),
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
        ),
      ],
    );
  }
}
