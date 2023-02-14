// import 'dart:io';

// import 'package:flutter_svg/svg.dart';
import 'package:marina_mall/core/constants/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../widgets/bottom_bar.dart';
import '/core/ui_core.dart';

class NavigateMapScreen extends StatelessWidget {
  final String url;
  const NavigateMapScreen({Key? key, required this.url}) : super(key: key);

  WebViewController initializeController(url) => WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },

        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        // onNavigationRequest: (NavigationRequest request) {
        //   if (request.url.startsWith('https://www.youtube.com/')) {
        //     return NavigationDecision.prevent;
        //   }
        //   return NavigationDecision.navigate;
        // },
      ),
    )
    ..loadRequest(Uri.parse(url));

  @override
  Widget build(BuildContext context) {
    WebViewController webViewController = initializeController(url);
    return WillPopScope(
      onWillPop: () async {
        if (await webViewController.canGoBack()) {
          await webViewController.goBack();
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF00649E),
        // appBar: AppBar(title: _topSearchBar(context)),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            color: AppColors.backgroundColor,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // _topSearchBar(context),
                // SizedBox(
                //   width: double.infinity,
                //   height: 6.h,
                //   child: _topSearchBar(context),
                // ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        height: 56,
                        width: double.infinity,
                        color: const Color(0xFF00649E),
                      ),
                      WebViewWidget(controller: webViewController),
                      SizedBox(
                        height: 56,
                        child: IconButton(
                          onPressed: () async {
                            if (await webViewController.canGoBack()) {
                              await webViewController.goBack();
                              return;
                            }
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const BottomBar(currentIndex: 3),
              ],
            ),
          ),
        ),
        // bottomNavigationBar: const BottomBar(currentIndex: 3),
        //  WebViewX(
        //   width: 100.w,
        //   height: 100.h,

        //   initialContent: '<h2> Hello, world! </h2>',
        //   initialSourceType: SourceType.html,
        //   onWebViewCreated: (controller) => webviewController = controller,
        // ),
      ),
    );
  }

  Widget _topSearchBar(BuildContext context) {
    return Container(
      height: 6.h,
      padding: EdgeInsets.all(3.w),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.chevron_left,
              color: Color(0xFF5E5E5E),
            ),
          ),
          SizedBox(width: 3.w),
          Image(
            height: 6.w,
            image: const AssetImage('assets/images/search_logo.png'),
            fit: BoxFit.fitHeight,
          ),
          const Spacer(),
          // SvgPicture.asset(
          //   'assets/svg/search.svg',
          //   height: 6.w,
          //   fit: BoxFit.fitHeight,
          // ),
          // SizedBox(
          //   width: 1.w,
          // ),
        ],
      ),
    );
  }
}
