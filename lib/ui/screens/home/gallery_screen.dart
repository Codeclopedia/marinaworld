import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:marina_mall/data/models/response/gallery_response.dart';

import '/controller/dataproviders.dart';
import '/core/constants.dart';
import '/core/state.dart';
import '/core/ui_core.dart';
import '../../widgets/app_top_bar.dart';
import '../../widgets/bottom_bar.dart';
import '../../widgets/common.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopBarSearch(path: 'assets/images/gallery_bg.png', index: -1),
            SizedBox(height: 2.h),
            Padding(
              padding: EdgeInsets.only(left: 6.w, bottom: 2.w, right: 6.w),
              child: Text(
                S.current.menu_gallery.toUpperCase(),
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
                return ref.watch(galleryProvider).when(
                    data: (data) {
                      if (data?.isNotEmpty == true) {
                        return _buildGallery(context, data!, isArabic);
                      } else {
                        return buildEmptyLoading('No Gallery');
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

  Widget _buildGallery(
      BuildContext context, List<GalleryItem> list, bool isArabic) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          mainAxisSpacing: 2.w,
          crossAxisSpacing: 2.w,
        ),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                MultiImageProvider multiImageProvider = MultiImageProvider(
                    initialIndex: index,
                    list.map((e) => getImageProvider(e.media ?? '')).toList());
                showImageViewerPager(context, multiImageProvider,
                    swipeDismissible: false,
                    immersive: true, onPageChanged: (page) {
                  print("page changed to $page");
                }, onViewerDismissed: (page) {
                  print("dismissed while on page $page");
                });
              },
              child: _buildItem(list[index].media ?? ''),
            ));
  }

  Widget _buildItem(String image) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(2)),
      child: Image(
        image: getImageProvider(image),
        // AssetImage('assets/images/promotion_sb.png'),
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
