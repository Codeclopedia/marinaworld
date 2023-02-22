// ignore_for_file: use_build_context_synchronously

import 'package:flutter_svg/flutter_svg.dart';
import '/controller/authproviders.dart';
import '/core/constants.dart';
import '/core/state.dart';
import '/core/ui_core.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../widgets/app_top_bar.dart';

class AboutMenu extends StatelessWidget {
  final int index;
  const AboutMenu({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(
        //   height: 12.w,
        // ),
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: SizedBox(
              width: double.infinity,
              height: 7.w + 6.h,
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.only(left: 6.w, right: 6.w),
          padding: EdgeInsets.only(top: 2.h, bottom: 3.5.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(2.w)),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Color(0x44AAAAAA),
                    // spreadRadius: 4,
                    blurRadius: 9,
                    offset: Offset(0, 5))
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer(
                builder: (context, ref, child) {
                  final user = ref.watch(authDataSourceProvider).getUser();
                  return GestureDetector(
                    onTap: user == null
                        ? () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, RouteNames.login, (route) => false);
                          }
                        : () {
                            Navigator.pop(context);
                            if (index >= 0) {
                              Navigator.pushNamed(
                                  context, RouteNames.editProfile,
                                  arguments: user);
                            } else {
                              Navigator.pushReplacementNamed(
                                  context, RouteNames.editProfile,
                                  arguments: user);
                            }
                          },
                    child: Row(
                      children: [
                        SizedBox(width: 5.w),
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 8.w,
                          // backgroundImage: ,
                          backgroundImage: const AssetImage(
                            'assets/images/user_placeholder.png',
                            // Icons.person,
                            // size: 10.w,
                            // color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user?.name ?? 'User Name',
                              style: TextStyle(
                                  fontFamily: kFontFamily,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            SizedBox(height: 0.5.h),
                            Text(
                              user?.email ?? 'User email',
                              style: TextStyle(
                                  fontFamily: kFontFamily,
                                  fontSize: 7.5.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 2.h),
              const Divider(height: 0.5, color: Colors.black26),
              SizedBox(height: 2.w),
              _buildTextAction(S.current.nav_home, () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                    context, RouteNames.home, (route) => false);

                // Navigator.pushNamedAndRemoveUntil(
                //     context, RouteNames.about, (route) => route.isFirst);
              }),
              _buildTextAction(S.current.menu_about_us, () {
                Navigator.pop(context);
                if (index >= 0) {
                  Navigator.pushNamed(context, RouteNames.about);
                } else {
                  Navigator.pushReplacementNamed(context, RouteNames.about);
                }
                // Navigator.pushNamedAndRemoveUntil(
                //     context, RouteNames.about, (route) => route.isFirst);
              }),
              _buildTextAction(S.current.menu_stores, () {
                Navigator.pop(context);
                if (index != 2) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RouteNames.stores, (route) => route.isFirst);
                }
              }),
              _buildTextAction(S.current.menu_dining, () {
                Navigator.pop(context);
                if (index != 1) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RouteNames.dining, (route) => route.isFirst);
                }
              }),
              _buildTextAction(S.current.menu_events, () {
                Navigator.pop(context);
                if (index >= 0) {
                  Navigator.pushNamed(context, RouteNames.events);
                } else {
                  Navigator.pushReplacementNamed(context, RouteNames.events);
                }
              }),
              _buildTextAction(S.current.menu_offers, () {
                Navigator.pop(context);
                if (index >= 0) {
                  Navigator.pushNamed(context, RouteNames.offers);
                } else {
                  Navigator.pushReplacementNamed(context, RouteNames.offers);
                }
              }),
              _buildTextAction(S.current.menu_leasing, () {
                Navigator.pop(context);
                if (index >= 0) {
                  Navigator.pushNamed(context, RouteNames.leasing);
                } else {
                  Navigator.pushReplacementNamed(context, RouteNames.leasing);
                }
              }),
              _buildTextAction(S.current.menu_gallery, () {
                Navigator.pop(context);
                if (index >= 0) {
                  Navigator.pushNamed(context, RouteNames.gallery);
                } else {
                  Navigator.pushReplacementNamed(context, RouteNames.gallery);
                }
              }),
              _buildTextAction(S.current.menu_opening_hr, () {
                Navigator.pop(context);
                if (index >= 0) {
                  Navigator.pushNamed(context, RouteNames.openingHours);
                } else {
                  Navigator.pushReplacementNamed(
                      context, RouteNames.openingHours);
                }
              }),
              _buildTextAction(S.current.menu_contact, () {
                Navigator.pop(context);
                if (index >= 0) {
                  Navigator.pushNamed(context, RouteNames.contactUs);
                } else {
                  Navigator.pushReplacementNamed(context, RouteNames.contactUs);
                }
              }),
              _buildTextAction(S.current.menu_choose_lang, () async {
                Navigator.pop(context);
                final result = await Navigator.pushNamed(
                    context, RouteNames.chooseLanguage);
                if (result == true) {
                  // Navigator.pop(context, true);

                } else {}
              }),
              SizedBox(height: 2.7.w),
              _buildLogoutTextAction(),
              const Divider(
                height: 0.5,
                color: Colors.black26,
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.w, top: 0.3.h),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          _launchLink(
                              'https://www.facebook.com/themarinamall/');
                        },
                        icon: SvgPicture.asset(
                          'assets/svg/icon_fb.svg',
                          width: 6.4.w,
                          fit: BoxFit.fitWidth,
                        )),
                    IconButton(
                        onPressed: () {
                          _launchLink(
                              'https://www.instagram.com/themarinamall/');
                        },
                        icon: SvgPicture.asset(
                          'assets/svg/icon_insta.svg',
                          width: 6.4.w,
                          fit: BoxFit.fitWidth,
                        )),
                    IconButton(
                        onPressed: () {
                          _launchLink('https://twitter.com/marinamallkw');
                        },
                        icon: SvgPicture.asset(
                          'assets/svg/icon_twitter.svg',
                          width: 8.w,
                          fit: BoxFit.fitWidth,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }

  _launchLink(String url) async {
    try {
      launchUrl(Uri.parse(url));
    } catch (e) {}
  }

  Widget _buildTextAction(String title, Function() onTapAction) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.75.w),
      child: InkWell(
        onTap: onTapAction,
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
              fontFamily: kFontFamily,
              fontSize: 11.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black),
        ),
      ),
    );
  }

  _buildLogoutTextAction() {
    return Consumer(builder: (context, ref, child) {
      final user = ref.watch(authDataSourceProvider).getUser();
      return user == null
          ? const SizedBox.shrink()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  height: 0.5,
                  color: Colors.black26,
                ),
                Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.75.w),
                  child: InkWell(
                    onTap: () async {
                      final logOut = await showLogoutDialog(context);
                      if (logOut != null && logOut) {
                        await ref.read(authDataSourceProvider).signOut();
                        ref.read(menuOpenStateProvider.notifier).state = false;

                        Navigator.pushNamedAndRemoveUntil(
                            context, RouteNames.login, (route) => false);
                      }
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/icon_logout.svg',
                          width: 4.w,
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          S.current.menu_logout.toUpperCase(),
                          style: TextStyle(
                              fontFamily: kFontFamily,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
    });
  }

  Widget _fakeSearchBar() {
    return Center(
      child: Container(
        width: 85.w,
        height: 6.h,
        padding: EdgeInsets.all(3.w),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Consumer(
          builder: (context, ref, child) {
            final menuVisible = ref.watch(menuOpenStateProvider);
            return Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (menuVisible)
                  InkWell(
                    onTap: () {
                      ref.read(menuOpenStateProvider.notifier).state = false;
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      color: Color(0xFF5E5E5E),
                    ),
                  ),
                SizedBox(
                  width: 3.w,
                ),
                Image(
                  width: 16.w,
                  image: const AssetImage('assets/images/search_logo.png'),
                  fit: BoxFit.fitWidth,
                ),
                const Spacer(),
                SvgPicture.asset(
                  'assets/svg/search.svg',
                  width: 6.w,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(
                  width: 1.w,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

Future showLogoutDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) => Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.w))),
            child: const LogOutDialog(),
          ));
}

class LogOutDialog extends StatelessWidget {
  const LogOutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S.current.logout_title.toUpperCase(),
            style: TextStyle(
                fontFamily: kFontFamily,
                color: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 2.w),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              S.current.logout_msg,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: kFontFamily,
                  color: Colors.black,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: 6.w),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                          fontFamily: kFontFamily,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400),
                      // foregroundColor: Colors.white,
                      backgroundColor: AppColors.primaryColor),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text(
                    S.current.logout_btx_yes,
                  ),
                ),
              ),
              SizedBox(width: 4.w),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                          fontFamily: kFontFamily,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400),
                      foregroundColor: AppColors.greyColor,
                      backgroundColor: AppColors.fillInputColor),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(S.current.logout_btx_no),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
