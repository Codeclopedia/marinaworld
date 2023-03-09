import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '/core/state.dart';
import '/data/models/response/home_response.dart';
import '/ui/widgets/bottom_bar.dart';
import '/ui/widgets/common.dart';

import '/controller/dataproviders.dart';
import '/core/constants.dart';
import '../../widgets/app_top_bar.dart';
import '/core/ui_core.dart';
import 'promo_detail_screen.dart';

class EventDetailScreen extends StatelessWidget {
  final Events events;
  const EventDetailScreen({Key? key, required this.events}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopBarSearch(
              path: 'assets/images/image_2023_02_16T07_08_10_867Z.png',
              index: -1,
              bgColor: Colors.white,
            ),
            SizedBox(height: 2.h),
            Consumer(builder: (context, ref, child) {
              bool isArabic = ref.watch(languageStateProvider) == langArabic;
              DateTime? start;

              if (events.startDate?.isNotEmpty == true) {
                try {
                  start = DateFormat('yyyy-MM-dd').parse(events.startDate!);
                } catch (e) {
                  print(e);
                }
              }
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          minHeight: 20.w,
                          maxHeight: 60.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(3.w)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(3.w)),
                          child: Image(
                            image: getImageProvider(events.ftImg ?? ''),
                            fit: BoxFit.fitWidth,
                          ),
                        )),
                    SizedBox(height: 4.h),
                    Text(
                      DateFormat("dd MMM yyyy").format(start ?? DateTime.now()),
                      style: TextStyle(
                          fontFamily: kFontFamily,
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                    SizedBox(height: 1.h),

                    Text(
                      (isArabic ? events.titleAr : events.title) ?? '',
                      style: TextStyle(
                          fontFamily: kFontFamily,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    SizedBox(height: 2.h),

                    InkWell(
                      onTap: () {
                        print(events.descriptionAr);
                      },
                      child: Text(
                        (isArabic
                                ? events.descriptionAr
                                : events.description) ??
                            '',
                        style: TextStyle(
                            fontFamily: kFontFamily,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                    // if (start != null) SizedBox(height: 2.h),
                    // if (start != null)
                    //   Container(
                    //     padding: EdgeInsets.symmetric(
                    //         horizontal: 4.w, vertical: 2.w),
                    //     decoration: BoxDecoration(
                    //       color: AppColors.primaryColor,
                    //       borderRadius: BorderRadius.all(Radius.circular(2.w)),
                    //       boxShadow: const [
                    //         BoxShadow(
                    //             color: Color(0x40000000),
                    //             offset: Offset(0, 4),
                    //             blurRadius: 11)
                    //       ],
                    //     ),

                    //     // style: ElevatedButton.styleFrom(
                    //     //     elevation: 2,
                    //     //     backgroundColor: AppColors.primaryColor,
                    //     //     foregroundColor: Colors.white),
                    //     child:
                    //   ),
                    SizedBox(height: 4.h),
                    Text(
                      S.current.btx_share,
                      style: TextStyle(
                        fontFamily: kFontFamily,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        _buildIcon('icon_share_facebook.svg',
                            () => shareEvent(ShareTo.facebook)),
                        SizedBox(width: 3.w),
                        _buildIcon('icon_share_insta.svg',
                            () => shareEvent(ShareTo.insta)),
                        SizedBox(width: 3.w),
                        _buildIcon('icon_share_twitter.svg',
                            () => shareEvent(ShareTo.twitter)),
                        SizedBox(width: 3.w),
                        _buildIcon('icon_share_whatsapp.svg',
                            () => shareEvent(ShareTo.whatsapp)),
                      ],
                    )
                  ],
                ),
              );
            })
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(currentIndex: -1),
    );
  }

  Widget _buildIcon(String iconName, Function() onTap) {
    return GestureDetector(
      onTap: () => onTap,
      child: SvgPicture.asset(
        'assets/svg/$iconName',
        width: 8.w,
        fit: BoxFit.fitWidth,
      ),
      // child: CircleAvatar(
      //   // backgroundColor: AppColors.primaryColor,
      //   radius: 4.w,
      //   child: SvgPicture.asset(
      //     'assets/svg/$iconName',
      //     width: 3.w,
      //     fit: BoxFit.fitWidth,
      //   ),
      // ),
    );
  }

  shareEvent(ShareTo to) {
    shareContent(to, '${events.title}\n${events.description}');
  }
}
