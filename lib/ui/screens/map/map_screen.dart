// import 'package:marina_mall/core/state.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// import '/ui/widgets/bottom_bar.dart';
// import '/core/ui_core.dart';

// class MapScreen extends ConsumerWidget {
//   const MapScreen({Key? key}) : super(key: key);

//   WebViewController initializeController(url) => WebViewController()
//     ..setJavaScriptMode(JavaScriptMode.unrestricted)
//     ..setBackgroundColor(const Color(0x00000000))
//     ..setNavigationDelegate(
//       NavigationDelegate(
//         onProgress: (int progress) {
//           // Update loading bar.
//         },

//         onPageStarted: (String url) {},
//         onPageFinished: (String url) {},
//         onWebResourceError: (WebResourceError error) {},
//         // onNavigationRequest: (NavigationRequest request) {
//         //   if (request.url.startsWith('https://www.youtube.com/')) {
//         //     return NavigationDecision.prevent;
//         //   }
//         //   return NavigationDecision.navigate;
//         // },
//       ),
//     )
//     ..loadRequest(Uri.parse(url));
//   @override
//   Widget build(BuildContext context,WidgetRef ref) {
    
//     //site/arb
//     WebViewController webViewController =
//         initializeController('https://map.webdesignkuwait.com/marinamall-kw/');

//     return WillPopScope(
//       onWillPop: () async {
//         if (await webViewController.canGoBack()) {
//           await webViewController.goBack();
//           return false;
//         }
//         return true;
//       },
//       child: Scaffold(
//         body: SafeArea(
//           child: Column(
//             children: [
//               Expanded(
//                 child: WebViewWidget(controller: webViewController),
//               ),
//               const BottomBar(currentIndex: 3)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
