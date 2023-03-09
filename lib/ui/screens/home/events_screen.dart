import 'package:intl/intl.dart';
import '/data/models/response/home_response.dart';

import '../../widgets/common.dart';
import '/controller/dataproviders.dart';
import '/core/constants.dart';
import '/core/state.dart';
import '/core/ui_core.dart';
import '../../widgets/app_top_bar.dart';
import '../../widgets/bottom_bar.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopBarSearch(
                path: 'assets/images/LAtest-Events.jpg', index: -1),
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.only(left: 6.w, right: 6.w),
              child: Text(
                S.current.heading_events,
                style: TextStyle(
                  fontFamily: kFontFamily,
                  color: Colors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Consumer(
              builder: (context, ref, child) {
                bool isArabic = ref.watch(languageStateProvider) == langArabic;
                return ref.watch(homeProvider).when(
                    data: (data) {
                      if (data?.offers?.isNotEmpty == true) {
                        return _buildEvents(
                            context, data!.events!.reversed.toList(), isArabic);
                      } else {
                        return buildEmptyLoading('No Events');
                      }
                    },
                    error: (er, st) =>
                        buildEmptyLoading('Error while loading events'),
                    loading: () => buildLoading);
                // return Container();
              },
            ),
            // const BottomBar(currentIndex: -1),
            // _bottomNavigation()
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(currentIndex: -1),
    );
  }

  Widget _buildEventCard(Events model, bool isArabic) {
    // print('start ${model.startDate}');

    DateTime? start;
    if (model.startDate?.isNotEmpty == true) {
      try {
        start = DateFormat.yMd().parse(model.startDate!);
        // print(
        //     'date ${DateFormat.d().format(start)} - ${DateFormat.MMMM().format(start)} - ${DateFormat.y().format(start)}');
      } catch (e) {}
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            offset: Offset(0, 4),
            color: Color(0x266D6D6D),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(3.w)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 45.w,
            // width: double.infinity,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image(
                    image: getImageProvider(model.ftImg ?? ''),
                    // 'assets/images/brands/${model.image}',
                    // width: 30.w,
                    width: double.infinity,
                    height: 45.w,
                    fit: BoxFit.cover,
                  ),
                ),
                if (start != null)
                  Positioned(
                    top: 1.5.w,
                    left: 1.5.w,
                    child: Container(
                      width: 15.w,
                      // height: 15.w,
                      padding: EdgeInsets.all(0.5.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(2.w)),
                        color: const Color(0xFF0088C4),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            DateFormat.d().format(start),
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: kFontFamily,
                            ),
                          ),
                          Text(
                            DateFormat.MMMM().format(start),
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: kFontFamily,
                            ),
                          ),
                          Text(
                            DateFormat.y().format(start),
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 7.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: kFontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(2.w),
            child: Text(
              (isArabic ? model.titleAr : model.title) ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: 8.sp,
                fontWeight: FontWeight.w500,
                fontFamily: kFontFamily,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEvents(BuildContext context, List<Events> list, bool isArabic) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        mainAxisSpacing: 1.h,
        crossAxisSpacing: 4.w,
      ),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () => Navigator.pushNamed(context, RouteNames.eventDetails,
            arguments: list[index]),
        child: _buildEventCard(list[index], isArabic),
      ),
    );
  }
}
