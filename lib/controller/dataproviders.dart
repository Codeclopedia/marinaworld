// import '/data/models/response/gallery_response.dart';
import 'package:marina_mall/data/models/response/country_data_response.dart';

import '../data/models/models.dart';
// import '/data/models/response/home_response.dart';

import '/core/constants.dart';
// import '/data/models/response/stores_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/core/state.dart';
// import '/data/models/response/dining_response.dart';
import '/data/network/api_service.dart';
import '/data/repository/remote_repository.dart';

final remoteRepositoryProvider = Provider<RemoteRepository>(
  (ref) => RemoteRepository(
    api: ref.read(apiServiceProvider),
  ),
);

final preferenceProvider = FutureProvider<SharedPreferences>(
  (ref) => SharedPreferences.getInstance(),
);
final homeProvider = FutureProvider<HomeBody?>(
    (ref) => ref.read(remoteRepositoryProvider).getHome());

final storesProvider = FutureProvider<StoresBody?>((ref) {
  return ref.read(remoteRepositoryProvider).getStores();
});

final diningProvider = FutureProvider<DiningBody?>((ref) {
  return ref.read(remoteRepositoryProvider).getDining();
});

final countriesDataProvider = FutureProvider<List<Countries>?>(
  (ref) {
    return ref.read(remoteRepositoryProvider).getcountriesData();
  },
);

final galleryProvider = FutureProvider<List<GalleryItem>?>(
    (ref) => ref.read(remoteRepositoryProvider).loadGallery());

final searchInputProvider = StateProvider.autoDispose<String>((ref) => '');

final searchProvider = FutureProvider.autoDispose<List<Stores>>((ref) async {
  final HomeBody? home = ref.read(homeProvider).valueOrNull;
  final List<Stores> empty = [];
  if (home == null) {
    return empty;
  }
  final input = ref.watch(searchInputProvider);
  // print('input: $input');
  if (input.isEmpty) {
    return empty;
  }
  final List<Stores> str = home.stores ?? empty;
  final List<Stores> dns = home.dinings ?? empty;
  final List<Stores> stores = [...str, ...dns];
  // print('total size: ${stores.length} ${str.length}  ${dns.length} ');
  return stores
      .where((element) =>
          (element.title ?? '').toLowerCase().contains(input.toLowerCase()) ||
          (element.titleAr ?? '').toLowerCase().contains(input.toLowerCase()))
      .toList();
});

final searchSuggestionProvider =
    FutureProvider.family.autoDispose<List<Stores>, String>((ref, input) {
  final HomeBody? home = ref.read(homeProvider).valueOrNull;
  final List<Stores> empty = [];
  if (home == null) {
    return empty;
  }

  if (input.isEmpty) {
    return empty;
  }
  final List<Stores> str = home.stores ?? empty;
  final List<Stores> dns = home.dinings ?? empty;
  final List<Stores> stores = [...str, ...dns];
  // print('total size: ${stores.length} ${str.length}  ${dns.length} ');
  return stores
      .where((element) =>
          (element.title ?? '').toLowerCase().contains(input.toLowerCase()) ||
          (element.titleAr ?? '').toLowerCase().contains(input.toLowerCase()))
      .toList();
});

// final findFavouriteProvider = StateProvider.family<bool, String>((ref, key) {
//   final pref = ref.watch(preferenceProvider);
//   return pref.value?.getBool('favourite_$key') ?? false;
// });

final favouriteStateProvider =
    StateNotifierProvider.family<FavoriteIds, bool, String>((ref, key) {
  final pref = ref.watch(sharedPrefs).maybeWhen(
        data: (value) => value,
        orElse: () => null,
      );
  return FavoriteIds(pref, key);
});

final languageStateProvider =
    StateNotifierProvider<LanguageNotifier, String>((ref) {
  // final pref = ref.watch(sharedPrefs).valueOrNull;
  final pref = ref.watch(sharedPrefs).maybeWhen(
        data: (value) => value,
        orElse: () => null,
      );
  return LanguageNotifier(pref);
});

class LanguageNotifier extends StateNotifier<String> {
  final SharedPreferences? pref;
  LanguageNotifier(this.pref)
      : super(pref?.getString('language') ?? langEnglish);

  void setLanguage(String language) async {
    kFontFamily = language == langArabic ? 'Tajawal' : 'euclid-circular';
    print(kFontFamily);
    await pref?.setString('language', language);
    state = language;
  }
}

class FavoriteIds extends StateNotifier<bool> {
  final SharedPreferences? pref;
  String key;
  FavoriteIds(this.pref, this.key) : super(pref?.getBool(key) ?? false);

  void toggle() async {
    state = !state;
    await pref?.setBool(key, state);
  }
}

final sharedPrefs = FutureProvider<SharedPreferences>(
    (_) async => await SharedPreferences.getInstance());
