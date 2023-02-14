// ignore_for_file: use_build_context_synchronously

// import 'package:flutter_gif/flutter_gif.dart';

// import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:marina_mall/main.dart';

import '/controller/dataproviders.dart';
import '/controller/authproviders.dart';
import '/core/constants.dart';
import '/core/state.dart';
import '/core/ui_core.dart';

class RouteLocatorScreen extends ConsumerWidget {
  const RouteLocatorScreen({super.key});

  _init() async {
    try {
      FirebaseMessaging.onMessageOpenedApp
          .listen((RemoteMessage message) async {
        if (message.data['type'] != null) {
          String routeScreen;
          print('Type ${message.data['type']}');
          switch (message.data['type']) {
            case 'event':
              routeScreen = RouteNames.events;
              break;
            case 'dining':
              routeScreen = RouteNames.dining;
              break;
            case 'store':
              routeScreen = RouteNames.store;
              break;
            case 'promo':
              routeScreen = RouteNames.offers;
              break;

            default:
              return;
          }
          BuildContext? cntx = navigatorKey.currentContext;
          if (cntx != null) {
            print('Opening $routeScreen');
            Navigator.pushNamed(cntx, routeScreen);
          }
        }
      });

      // FirebaseMessaging.instance.subscribeToTopic('news');
      // final token = await FirebaseMessaging.instance.getToken();
      // print('$token');
      // FirebaseMessaging.onMessage.listen((event) {
      //   print('${event.data} => ${event.notification}');
      // });
    } catch (e) {
      print('Error in subscribing');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _init();
    ref.listen(authLoadProvider, (previous, next) async {
      if (next.value != null) {
        int time = DateTime.now().millisecondsSinceEpoch;
        // print('loading started');
        final home = ref.read(homeProvider).maybeWhen(orElse: () => null);
        // print(
        //     'loaded home-> ${home != null} ,  time taken ${DateTime.now().millisecondsSinceEpoch - time}');
        final stores = ref.read(storesProvider).maybeWhen(orElse: () => null);
        // print(
        //     'loaded stores-> ${stores != null}  , time taken ${DateTime.now().millisecondsSinceEpoch - time}');
        final dining = ref.read(diningProvider).maybeWhen(orElse: () => null);
        // print(
        //     'loaded dining-> ${dining != null}  ,time taken ${DateTime.now().millisecondsSinceEpoch - time}');

        int diff = 6000 - (DateTime.now().millisecondsSinceEpoch - time);

        // await FirebaseMessaging.onMessageOpenedApp.;

        final message = await FirebaseMessaging.instance.getInitialMessage();
        String routeScreen = RouteNames.home;
        bool tab = true;
        if (message != null) {
          switch (message.data['type']) {
            case 'event':
              routeScreen = RouteNames.events;
              tab = false;
              break;
            case 'dining':
              routeScreen = RouteNames.dining;
              tab = true;
              break;
            case 'store':
              routeScreen = RouteNames.store;
              tab = true;
              break;
            case 'promo':
              routeScreen = RouteNames.offers;
              tab = false;
              break;
            default:
              routeScreen = RouteNames.home;
          }
        } else {
          routeScreen = RouteNames.home;
        }

        // print('time taken to-> ${diff}');
        if (diff > 0) {
          // print('Opening $routeScreen');
          await Future.delayed(Duration(milliseconds: diff));
          if (tab) {
            Navigator.pushReplacementNamed(context, routeScreen);
          } else {
            Navigator.pushReplacementNamed(context, RouteNames.home);
            Navigator.pushNamed(context, routeScreen);
          }
          Navigator.pushReplacementNamed(context, routeScreen);
        } else {
          // print('Opening $routeScreen');
          if (tab) {
            Navigator.pushReplacementNamed(context, routeScreen);
          } else {
            Navigator.pushReplacementNamed(context, RouteNames.home);
            Navigator.pushNamed(context, routeScreen);
          }
        }
        // ref.read(homeProvider).whenData((value) {
        //   print('loaded home');
        //   ref.read(storesProvider).whenData((value) {
        //     print('loaded stores');
        //     ref.read(diningProvider).whenData((value) async {
        //       print('loaded dining');

        //     });
        //   });
        // });
      } else {
        await Future.delayed(const Duration(seconds: 7));
        Navigator.pushReplacementNamed(context, RouteNames.chooseLanguageLogin);
      }
    });
    return const SplashScreen();
  }
}

// class RouteLocatorScreen1 extends StatefulHookConsumerWidget {
//   const RouteLocatorScreen1({Key? key}) : super(key: key);

//   @override
//   ConsumerState<RouteLocatorScreen> createState() => _RouteLocatorScreenState();
// }

// class _RouteLocatorScreenState extends ConsumerState<RouteLocatorScreen>
//     with TickerProviderStateMixin {
//   late FlutterGifController _controller;
//   @override
//   void initState() {
//     _controller = FlutterGifController(vsync: this);
//     _controller.repeat(
//         min: 0, max: 29, period: const Duration(milliseconds: 300));
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     ref.listen(authLoadProvider, (previous, next) async {
//       if (next.value != null) {
//         int time = DateTime.now().millisecondsSinceEpoch;
//         // print('loading started');
//         final home = ref.read(homeProvider).maybeWhen(orElse: () => null);
//         // print(
//         //     'loaded home-> ${home != null} ,  time taken ${DateTime.now().millisecondsSinceEpoch - time}');
//         final stores = ref.read(storesProvider).maybeWhen(orElse: () => null);
//         // print(
//         //     'loaded stores-> ${stores != null}  , time taken ${DateTime.now().millisecondsSinceEpoch - time}');
//         final dining = ref.read(diningProvider).maybeWhen(orElse: () => null);
//         // print(
//         //     'loaded dining-> ${dining != null}  ,time taken ${DateTime.now().millisecondsSinceEpoch - time}');

//         int diff = 8000 - (DateTime.now().millisecondsSinceEpoch - time);
//         // print('time taken to-> ${diff}');
//         if (diff > 0) {
//           await Future.delayed(Duration(milliseconds: diff));
//           Navigator.pushReplacementNamed(context, RouteNames.home);
//         } else {
//           Navigator.pushReplacementNamed(context, RouteNames.home);
//         }
//         // ref.read(homeProvider).whenData((value) {
//         //   print('loaded home');
//         //   ref.read(storesProvider).whenData((value) {
//         //     print('loaded stores');
//         //     ref.read(diningProvider).whenData((value) async {
//         //       print('loaded dining');

//         //     });
//         //   });
//         // });
//       } else {
//         await Future.delayed(const Duration(seconds: 2));
//         Navigator.pushReplacementNamed(context, RouteNames.login);
//       }
//     });
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         child: GifImage(
//           controller: _controller,
//           image: const AssetImage("assets/images/splash_loader.gif"),
//         ),
//       ),
//     );
//   }
// }

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 80.w,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/loader.gif'),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}
