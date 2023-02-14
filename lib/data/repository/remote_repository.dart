import 'package:intl/intl.dart';
// import 'package:marina_mall/data/models/response/gallery_response.dart';
// import 'package:marina_mall/data/models/response/home_response.dart';

import '../../core/ui_core.dart';
import '../models/models.dart';
// import '../models/response/dining_response.dart';
// import '../models/response/stores_response.dart';
import '../network/api_service.dart';

const successfull = 'success';

class RemoteRepository {
  final ApiService api;
  RemoteRepository({required this.api});

  // Future<String?> signUp() async {
  //   final result = await api.getHome();
  //   if (result.status == successfull && result.body != null) {
  //     return result.body;
  //   }
  //   return null;
  // }

  Future<HomeBody?> getHome() async {
    final result = await api.getHome();
    if (result.status == successfull && result.body != null) {
      return result.body;
    }
    return null;
  }

  Future<StoresBody?> getStores() async {
    final result = await api.getStores();
    if (result.status == successfull && result.body != null) {
      return result.body;
    }
    return null;
  }

  Future<DiningBody?> getDining() async {
    final result = await api.getDining();
    if (result.status == successfull && result.body != null) {
      return result.body;
    }
    return null;
  }

  Future<List<GalleryItem>?> loadGallery() async {
    final result = await api.loadGallery();
    if (result.status == 'successful' && result.body != null) {
      return result.body;
    }
    return null;
  }

  Future<String?> editProfile(
      User user, String name, String gender, DateTime dob) async {
    bool isFilled = !DateUtils.isSameDay(dob, DateTime.now());
    String dobStr = '';
    if (isFilled) {
      dobStr = DateFormat('yyyy-MM-dd').format(dob);
    }
    // String nat = '';
    // if (nationality != S.current.signup_nationality_hint) {
    //   nat = nationality == 'Kuwait' ? 'KW' : 'IN';
    // }

    String gen = '';
    if (gender != S.current.signup_gender_hint) {
      gen = gender;
    }
    final result = await api.editProfile(
        user.authToken ?? '', user.id.toString(), name, gen, dobStr);
    if (result.status == 'successful') {
      return null;
    }
    return result.message;
    // User? user = getme
  }
}
