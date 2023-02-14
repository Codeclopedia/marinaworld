import '../data/models/models.dart';
import '/ui/screens/screens.dart';
import 'constants/route_names.dart';
import 'ui_core.dart';

class Routes {
  static Route generateRoute(RouteSettings settings) {
    bool isTab = false;
    final Widget screen;
    switch (settings.name) {
      case RouteNames.splash:
        screen = const SplashScreen();
        break;
      case RouteNames.register:
        screen = RegisterScreen();
        break;
      case RouteNames.login:
        screen = LoginScreen();
        break;
      case RouteNames.loginMobile:
        screen = LoginMobileScreen();
        break;
      case RouteNames.verifyOtp://DbxKwt123
        // settings.arguments
        final phone = settings.arguments as String;
        screen = VerifyOtpScreen(phone: phone);
        break;
      case RouteNames.editProfile:
        final user = settings.arguments as User;
        screen = EditProfileScreen(user: user);
        break;
      case RouteNames.forgetPassword:
        screen = ForgotPasswordScreen();
        break;
      // case RouteNames.verifyOtpForget:
      //   final email = settings.arguments as String;
      //   screen = VerifyForgotOtpScreen(email: email);
      //   break;
      case RouteNames.changePassword:
        final phone = settings.arguments as String;
        screen = ChangePasswordScreen(phone: phone);
        break;
      case RouteNames.chooseLanguage:
        screen = ChooseLanguageScreen();
        break;
      case RouteNames.chooseLanguageLogin:
        screen = ChooseLanguageScreen(loadLogin: true);
        break;
      case RouteNames.openingHours:
        screen = const OpeningHourScreen();
        break;
      case RouteNames.leasing:
        screen = LeasingScreen();
        break;
      case RouteNames.contactUs:
        screen = ContactUsScreen();
        break;
      case RouteNames.gallery:
        screen = const GalleryScreen();
        break;
      case RouteNames.home:
        screen = const HomeScreen();
        isTab = true;
        break;
      case RouteNames.categories:
        screen = const CategoriesScreen();
        break;
      case RouteNames.stores:
        isTab = true;
        screen = const StoresScreen();
        break;
      case RouteNames.storeDetail:
        final stores = settings.arguments as Stores;
        screen = StoreDetailScreen(store: stores);
        break;

      case RouteNames.dining:
        isTab = true;
        screen = const HomeDiningScreen();
        break;
      case RouteNames.search:
        screen = SearchStoreScreen();
        break;

      case RouteNames.searchStore:
        screen = const SearchFilterScreen();
        break;
      case RouteNames.searchDining:
        screen = const SearchFilterScreen(isDining: true);
        break;
      case RouteNames.searchResult:
        final stores = settings.arguments as List<Stores>;
        screen = SearchResultScreen(results: stores);
        break;
      case RouteNames.searchResultCat:
        if (settings.arguments is Map<String, dynamic>) {
          Map map = settings.arguments as Map<String, dynamic>;
          final stores = map['stores'] as List<Stores>;
          final title = map['title'] as String;
          final id = map['id'];
          screen = SearchResultScreen(results: stores, title: title, id: id);
        } else {
          screen = Scaffold(
            body: Center(
              child: Text('invalid parameter ${settings.name} yet.'),
            ),
          );
        }
        break;
      // final stores = settings.arguments as List<Stores>;
      // screen = SearchResultScreen(results: stores);
      // break;

      case RouteNames.map:
        isTab = true;
        screen = const NavigateMapScreen(
            url: 'https://map.webdesignkuwait.com/marinamall-app');
        break;
      case RouteNames.mapAr:
        isTab = true;
        screen = const NavigateMapScreen(
            url: 'https://map.webdesignkuwait.com/marinamall-app/site/arb');
        break;
      case RouteNames.navigateMap:
        if (settings.arguments is String) {
          String url = settings.arguments as String;
          if (url
              .startsWith('https://map.webdesignkuwait.com/marinamall-kw/')) {
            url = url.replaceFirst(
                'https://map.webdesignkuwait.com/marinamall-kw/',
                'https://map.webdesignkuwait.com/marinamall-app/');
          }

          screen = NavigateMapScreen(url: url);
          isTab = false;
        } else {
          isTab = false;
          screen = const NavigateMapScreen(
              url: 'https://map.webdesignkuwait.com/marinamall-app/');
          //'https://map.webdesignkuwait.com/marinamall-kw/'
          // screen = const MapScreen();
        }
        //https://map.webdesignkuwait.com/marinamall-kw/
        //https://map.webdesignkuwait.com/marinamall-app/

        break;

      case RouteNames.about:
        screen = const AboutScreen();
        break;
      case RouteNames.offers:
        screen = const OffersScreen();
        break;
      case RouteNames.offerDetails:
        if (settings.arguments is Offers) {
          final offer = settings.arguments as Offers;
          screen = OfferDetailScreen(offer: offer);
        } else {
          screen = const EventsScreen();
        }

        break;
      case RouteNames.events:
        screen = const EventsScreen();
        break;
      case RouteNames.eventDetails:
        if (settings.arguments is Events) {
          final events = settings.arguments as Events;
          screen = EventDetailScreen(events: events);
        } else {
          screen = const EventsScreen();
        }

        break;
      default:
        screen = Scaffold(
          body: Center(
            child: Text('No routes defined for ${settings.name} yet.'),
          ),
        );
    }
    if (isTab) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const curve = Curves.ease;
          var tween =
              Tween<double>(begin: 0, end: 1).chain(CurveTween(curve: curve));

          return FadeTransition(
            opacity: animation.drive(tween),
            child: child,
          );
        },
      );
    }

    return MaterialPageRoute(builder: (_) => screen);
  }
}
