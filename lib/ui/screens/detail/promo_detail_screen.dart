import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:appinio_social_share/appinio_social_share.dart';
// import 'package:share_plus/share_plus.dart';
import '/core/state.dart';
import '/data/models/response/home_response.dart';
import '/ui/widgets/bottom_bar.dart';
import '/ui/widgets/common.dart';

import '/controller/dataproviders.dart';
import '/core/constants.dart';
import '../../widgets/app_top_bar.dart';
import '/core/ui_core.dart';

class OfferDetailScreen extends StatelessWidget {
  final Offers offer;
  const OfferDetailScreen({Key? key, required this.offer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const TopBarSearch(
            path: 'assets/images/offer_bg.png',
            index: -1,
            bgColor: Colors.white,
          ),
          SizedBox(height: 2.h),
          Expanded(child: Consumer(builder: (context, ref, child) {
            bool isArabic = ref.watch(languageStateProvider) == langArabic;
            DateTime? start;
            if (offer.startDate?.isNotEmpty == true) {
              try {
                start = DateFormat.yMd().parse(offer.startDate!);
                // print(
                //     'date ${DateFormat.d().format(start)} - ${DateFormat.MMMM().format(start)} - ${DateFormat.y().format(start)}');
              } catch (_) {}
            }
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(3.w)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(3.w)),
                          child: Image(
                            image: getImageProvider(offer.ftImg ?? ''),
                            fit: BoxFit.fitWidth,
                          ),
                        )),
                    SizedBox(height: 4.h),
                    Text(
                      (isArabic ? offer.titleAr : offer.title)?.toUpperCase() ??
                          '',
                      style: TextStyle(
                          fontFamily: kFontFamily,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    if (start != null) SizedBox(height: 2.h),
                    if (start != null)
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 2.w),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(2.w)),
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0x40000000),
                                offset: Offset(0, 4),
                                blurRadius: 11)
                          ],
                        ),

                        // style: ElevatedButton.styleFrom(
                        //     elevation: 2,
                        //     backgroundColor: AppColors.primaryColor,
                        //     foregroundColor: Colors.white),
                        child: Text(
                          DateFormat('dd MMMM, y').format(start),
                          style: TextStyle(
                              fontFamily: kFontFamily,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    SizedBox(height: 2.h),
                    Text(
                      S.current.btx_share.toUpperCase(),
                      style: TextStyle(
                        fontFamily: kFontFamily,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        _buildIcon('icon_share_facebook.svg',
                            () => shareOffer(ShareTo.facebook)),
                        SizedBox(width: 3.w),
                        _buildIcon('icon_share_insta.svg',
                            () => shareOffer(ShareTo.insta)),
                        SizedBox(width: 3.w),
                        _buildIcon('icon_share_twitter.svg',
                            () => shareOffer(ShareTo.twitter)),
                        SizedBox(width: 3.w),
                        _buildIcon('icon_share_whatsapp.svg',
                            () => shareOffer(ShareTo.whatsapp)),
                      ],
                    ),
                    SizedBox(height: 1.h),
                  ],
                ),
              ),
            );
          }))
        ],
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

  shareOffer(ShareTo to) {
    print('shareOffer to ${to.name}');
    shareContent(to, '${offer.title}\n${offer.description}');
  }
}

shareContent(ShareTo to, String content) async {
  print('Shareing to ${to.name}=> $content');
  switch (to) {
    case ShareTo.facebook:
      String response = await AppinioSocialShare().shareToMessenger(content);
      print(response);
      break;
    case ShareTo.insta:
      String response =
          await AppinioSocialShare().shareToInstagramFeed(content);
      print(response);
      break;
    case ShareTo.twitter:
      String response = await AppinioSocialShare().shareToTwitter(content);
      print(response);
      break;
    case ShareTo.whatsapp:
      String response = await AppinioSocialShare().shareToWhatsapp(content);
      print(response);
      break;
    default:
  }
}

enum ShareTo { facebook, insta, twitter, whatsapp }
