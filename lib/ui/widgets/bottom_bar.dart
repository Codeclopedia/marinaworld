import 'package:flutter_svg/svg.dart';
import 'package:marina_mall/core/state.dart';

import '../../controller/dataproviders.dart';
import '../../core/constants.dart';
import '../../core/ui_core.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  const BottomBar({Key? key, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      margin: EdgeInsets.only(bottom: 3.h, left: 10.w, right: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              offset: const Offset(0, 4),
              color: Colors.black.withAlpha(0x0D)),
        ],
        borderRadius: BorderRadius.all(Radius.circular(6.w)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                    onTap: () {
                      if (currentIndex == 0) return;
                      Navigator.pushNamedAndRemoveUntil(
                          context, RouteNames.home, (route) => route.isFirst);
                    },
                    child: _navItem(
                        S.current.nav_home, 'nav_home.svg', currentIndex == 0)),
              ),
              Expanded(
                child: InkWell(
                    onTap: () {
                      if (currentIndex == 1) return;
                      Navigator.pushNamedAndRemoveUntil(
                          context, RouteNames.dining, (route) => route.isFirst);
                    },
                    child: _navItem(S.current.menu_dining, 'nav_dining.svg',
                        currentIndex == 1)),
              ),
              Expanded(
                child: InkWell(
                    onTap: () {
                      if (currentIndex == 2) return;
                      Navigator.pushNamedAndRemoveUntil(
                          context, RouteNames.stores, (route) => route.isFirst);
                    },
                    child: _navItem(S.current.menu_stores, 'nav_store.svg',
                        currentIndex == 2)),
              ),
              Expanded(
                child: Consumer(builder: (context, ref, child) {
                  final isArabic =
                      ref.watch(languageStateProvider) == langArabic;
                  return InkWell(
                      onTap: () {
                        if (currentIndex == 3) return;
                        Navigator.pushNamedAndRemoveUntil(
                            context,
                            isArabic ? RouteNames.mapAr : RouteNames.map,
                            (route) => route.isFirst);
                      },
                      child: _navItem(S.current.nav_map, 'nav_mall_map.svg',
                          currentIndex == 3));
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _navItem(String label, String svgName, bool selected) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SvgPicture.asset(
            'assets/svg/$svgName',
            color: selected ? AppColors.primaryColor : Colors.black,
            width: 24,
            height: 24,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: selected ? AppColors.primaryColor : Colors.black,
                fontSize: 6.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
