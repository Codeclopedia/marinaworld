import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '/firebase_options.dart';

import 'controller/dataproviders.dart';
import 'core/constants.dart';
import 'core/routes.dart';
import 'core/state.dart';
import 'core/theme/app_theme.dart';
import 'core/ui_core.dart';
import 'ui/screens/splash_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
  //     // statusBarColor: Colors.white, // Color for Android
  //     statusBarBrightness:
  //         Brightness.dark // Dark == white status bar -- for IOS.
  //     ));
  if (Platform.isAndroid) {
    await Firebase.initializeApp();
  } else {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  runZonedGuarded(() {
    runApp(
      const ProviderScope(
        child: ResponsiveApp(),
      ),
    );
  }, (error, stackTrace) {});
  // runApp(const ProviderScope(child: ResponsiveApp()));
}

@pragma('vm:entry-point')
Future<void> backgroundHandler(RemoteMessage message) async {
  if (Platform.isAndroid) {
    await Firebase.initializeApp();
  } else {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }
}

class ResponsiveApp extends StatelessWidget {
  const ResponsiveApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => const MarinaMallApp(),
    );
  }
}

class MarinaMallApp extends ConsumerWidget {
  const MarinaMallApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isArabic = ref.watch(languageStateProvider) == langArabic;
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: AppTheme.themeLight,
      darkTheme: AppTheme.themeDark,
      themeMode: ThemeMode.light,
      builder: EasyLoading.init(),
      navigatorKey: navigatorKey,
      onGenerateRoute: Routes.generateRoute,
      locale: isArabic
          ? const Locale.fromSubtags(languageCode: 'ar')
          : const Locale.fromSubtags(languageCode: 'en'),
      home: const RouteLocatorScreen(),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
