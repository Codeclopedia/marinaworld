import 'dart:convert';
// import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:marina_mall/data/models/response/auth/register_sms_response.dart';
import 'package:marina_mall/data/models/response/country_data_response.dart';

import '../../generated/l10n.dart';
import '../models/models.dart';
import '/core/state.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  late Dio _dio;

  // static const String baseUrlLogin =
  //     'https://www.arabic.marinaworld.com.kw/api/';
  static const String baseUrl = 'https://www.marinaworld.com.kw/api/';
  //https://www.marinaworld.com.kw/api/store-directory
  ApiService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    );
    _dio = Dio(options);
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.connectTimeout = 150000;
  }

  Future<LoginOTPResponse> loginOtp(String phone) async {
    final data = {
      'phone': phone,
      //'request_access': 'allow',
    };
    try {
      final response =
          await _dio.post('${baseUrl}user/login-withotp', data: data);
      debugPrint('Response: ${response.data}');

      if (response.statusCode == 200) {
        return LoginOTPResponse.fromJson(response.data);
      } else {
        debugPrint(
            'loginOtp => Code: ${response.statusCode}, msg:${response.statusMessage} ');
        return LoginOTPResponse(
            status: 'error',
            message: 'Error:${response.statusCode}- ${response.statusMessage}');
        // Helper.showMessage(response.statusMessage);

      }
    } catch (e) {
      debugPrint('Error:loginOtp => $e');
    }
    return LoginOTPResponse(
        status: 'error', message: S.current.msg_unknown_error);
  }

  Future<LoginOTPVerifyResponse> verifyLoginOtp(
      String phone, String otp) async {
    final data = {
      'phone': phone,
      'otp': otp,
      //'request_access': 'allow',
    };
    try {
      final response =
          await _dio.post('${baseUrl}user/login-otp-verify', data: data);
      debugPrint('Response: ${response.data}');

      if (response.statusCode == 200) {
        return LoginOTPVerifyResponse.fromJson(response.data);
      } else {
        debugPrint(
            'verifyLoginOtp => Code: ${response.statusCode}, msg:${response.statusMessage} ');

        return LoginOTPVerifyResponse(
            status: 'error',
            message: 'Error:${response.statusCode}- ${response.statusMessage}');
      }
    } catch (e) {
      debugPrint('Error:verifyLoginOtp => $e');
    }
    return LoginOTPVerifyResponse(
        status: 'error', message: S.current.msg_unknown_error);
  }

  Future<LoginResponse> login(String email, String password) async {
    final data = {
      'email': email,
      'password': password,
    };
    try {
      final response = await _dio.post('${baseUrl}auth', data: data);
      debugPrint('Response: ${response.data}');

      if (response.statusCode == 200) {
        return LoginResponse.fromJson(response.data);
      } else {
        return LoginResponse(
            status: 'error',
            message: 'Error:${response.statusCode}- ${response.statusMessage}');
        // Helper.showMessage(response.statusMessage);

      }
    } catch (e) {}
    return LoginResponse(status: 'error', message: S.current.msg_unknown_error);
  }

  Future<CountriesDataResponse> getCountriesdata() async {
    try {
      final response = await _dio.get('${baseUrl}all-countries');
      print('Response: ${response.data}');

      if (response.statusCode == 200) {
        return CountriesDataResponse.fromJson(response.data);
      } else {
        return CountriesDataResponse(
            status: 'error',
            message: 'Error:${response.statusCode}- ${response.statusMessage}');
        // Helper.showMessage(response.statusMessage);

      }
    } catch (e) {
      print(e);
    }
    return CountriesDataResponse(
        status: 'error', message: S.current.msg_unknown_error);
  }

  Future<RegisterResponse> register(String name, String email, String password,
      String phone, String gender, String dob, String nationality) async {
    final data = {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'gender': gender,
      'dob': dob,
      'nationality': nationality,
      //'request_access': 'allow',

      // 'nationality': nationality
    };
    try {
      print('Register=> ${jsonEncode(data)}');

      final response = await _dio.post('${baseUrl}user/create', data: data);

      if (response.statusCode == 200) {
        print('Register=> ${jsonEncode(response.data)}');
        return RegisterResponse.fromJson(response.data);
      } else {
        print('Register=> ${response.statusCode}: ${response.statusMessage}');
        return RegisterResponse(
            status: 'error', message: S.current.msg_unknown_error);
      }
    } catch (e) {
      print('error $e');
      return RegisterResponse(
          status: 'error', message: S.current.msg_unknown_error);
    }
  }

  Future<RegisterSMSResponse> sendOtp(String phone) async {
    final data = {
      'phone': phone,
      //'request_access': 'allow',
    };
    try {
      final response = await _dio.post('${baseUrl}user/reset-sms', data: data);
      debugPrint('sendOtp=> ${jsonEncode(response.data)}');
      if (response.statusCode == 200) {
        return RegisterSMSResponse.fromJson(response.data);
      } else {
        return RegisterSMSResponse(
            status: 'error', message: S.current.msg_unknown_error);
      }
    } catch (e) {
      debugPrint('error $e');
      return RegisterSMSResponse(
          status: 'error', message: S.current.msg_unknown_error);
    }
    // return null;
  }

  Future<BaseResponse> checkOtp(String phone, String otp) async {
    final data = {
      'phone': phone,
      'otp': otp,
      //'request_access': 'allow',
    };
    try {
      final response = await _dio.post('${baseUrl}user/checkotp', data: data);
      debugPrint('checkOtp=> ${jsonEncode(response.data)}');
      if (response.statusCode == 200) {
        return BaseResponse.fromJson(response.data);
      }
    } catch (e) {
      print('error $e');
    }
    return BaseResponse(status: 'error', message: S.current.msg_unknown_error);
  }

  Future<BaseResponse> forgotPassword(String phone) async {
    final data = {
      'phone': phone,
      //'request_access': 'allow',
    };
    try {
      //https://www.marinaworld.com.kw/api/user/forgot-password
      final response =
          await _dio.post('${baseUrl}user/forgot-password', data: data);
      debugPrint('forgotPassword=> ${jsonEncode(response.data)}');
      if (response.statusCode == 200) {
        return BaseResponse.fromJson(response.data);
      } else {
        return BaseResponse(
            status: 'error', message: S.current.msg_unknown_error);
      }
    } catch (e) {
      print('error $e');
      return BaseResponse(
          status: 'error', message: S.current.msg_unknown_error);
    }
    // return null;
  }

  Future<BaseResponse> verifyForgotOtp(String phone, String otp) async {
    final data = {
      'phone': phone,
      'otp': otp,
      //'request_access': 'allow',
    };
    try {
      final response = await _dio.post('${baseUrl}user/varify-otp', data: data);
      debugPrint('verifyForgotOtp=> ${jsonEncode(response.data)}');
      if (response.statusCode == 200) {
        return BaseResponse.fromJson(response.data);
      } else {}
    } catch (e) {
      print('error $e');
    }
    return BaseResponse(status: 'error', message: S.current.msg_unknown_error);
  }

  Future<BaseResponse> changePassword(
      String phone, String password, String confirm) async {
    final data = {
      'phone': phone,
      'password': password,
      'password_confirmation': confirm
    };
    try {
      final response =
          await _dio.post('${baseUrl}user/change-password', data: data);
      // print('change-password=> ${jsonEncode(response.data)}');
      if (response.statusCode == 200) {
        return BaseResponse.fromJson(response.data);
      }
    } catch (e) {
      print('error $e');
    }
    return BaseResponse(status: 'error', message: S.current.msg_unknown_error);
  }

  Future<HomeResponse> getHome() async {
    try {
      // print('request ${baseUrl}store-directory');
      final response = await _dio.get('${baseUrl}home');
      // print('response ${jsonEncode(response.data)}');
      if (response.statusCode == 200) {
        return HomeResponse.fromJson(response.data);
      } else {
        // print('error response ${jsonEncode(response.data)}');
        return HomeResponse(
            status: 'error',
            message: '${response.statusCode}- ${response.statusMessage}');
      }
    } catch (e) {
      print("gethome()");
      print('Error $e');
      return HomeResponse(status: 'error', message: 'Unknown error -$e');
    }
  }

  Future<StoresResponse> getStores() async {
    try {
      final response = await _dio.get('${baseUrl}store-directory');
      // print('response ${jsonEncode(response.data)}');
      if (response.statusCode == 200) {
        return StoresResponse.fromJson(response.data);
      } else {
        // print('error response ${jsonEncode(response.data)}');
        return StoresResponse(
          status: 'error',
        );
      }
    } catch (e) {
      print('Error in get stores $e');
      return StoresResponse(
        status: 'error',
      );
    }
  }

  Future<DiningResponse> getDining() async {
    try {
      // print('request ${baseUrl}store-directory');
      final response = await _dio.get('${baseUrl}dining-directory');
      // print('response ${jsonEncode(response.data)}');
      if (response.statusCode == 200) {
        return DiningResponse.fromJson(response.data);
      } else {
        // print('error response ${jsonEncode(response.data)}');
        return DiningResponse(
            status: 'error',
            message: '${response.statusCode}- ${response.statusMessage}');
      }
    } catch (e) {
      print('Error in get dining $e');
      return DiningResponse(status: 'error', message: 'Unknown error -$e');
    }
  }

  Future<GalleryResponse> loadGallery() async {
    try {
      final response = await _dio.get('${baseUrl}gallery');

      if (response.statusCode == 200) {
        return GalleryResponse.fromJson(response.data);
      } else {
        return GalleryResponse(
            status: 'error',
            message: '${response.statusCode}- ${response.statusMessage}');
      }
    } catch (e) {
      print('Error $e');
      return GalleryResponse(status: 'error', message: 'Unknown error -$e');
    }
  }

  Future<BaseResponse> postContact(
      String name, String phone, String email, String message) async {
    try {
      final data = {
        'email': email,
        'phone': phone,
        'name': name,
        'message': message,
      };

      final response = await _dio.post('${baseUrl}add-contact', data: data);

      if (response.statusCode == 200) {
        return BaseResponse.fromJson(response.data);
      } else {
        return BaseResponse(
            status: 'error',
            message: '${response.statusCode}- ${response.statusMessage}');
      }
    } catch (e) {
      print('Error $e');
      return BaseResponse(status: 'error', message: 'Unknown error -$e');
    }
  }

//name
// area
// floor
// intended_use
// brand_name
// document
// address
// telephone
// fax
// email
// other_location
// other_business

// POST REQUEST
// https://www.marinaworld.com.kw/api/add-leasing
  Future<BaseResponse> postLeasing(
      {required String name,
      required String area,
      required String floor,
      required String intendedUse,
      required String brandName,
      required String address,
      required String telephone,
      required String fax,
      required String email,
      required String otherLocations,
      required String otherBusinesses,
      PlatformFile? document}) async {
    try {
      final Map<String, dynamic> data = {
        'name': name,
        'area': area,
        'floor': floor,
        'intended_use': intendedUse,
        'brand_name': brandName,
        'address': address,
        'telephone': telephone,
        'fax': fax,
        'email': email,
        'other_location': otherLocations,
        'other_business': otherBusinesses,
      };
      if (document != null) {
        String fileName = document.name;
        data.addAll({
          'document':
              await MultipartFile.fromFile(document.path!, filename: fileName)
        });
      }

      final response = await _dio.post(
        '${baseUrl}add-leasing',
        data: FormData.fromMap(data),
      );
      if (response.statusCode == 200) {
        return BaseResponse.fromJson(response.data);
      } else {
        return BaseResponse(
            status: 'error',
            message: '${response.statusCode}- ${response.statusMessage}');
      }
    } catch (e) {
      print('Error $e');
      return BaseResponse(status: 'error', message: 'Unknown error -$e');
    }
  }

  Future<BaseResponse> editProfile(String authToken, String userId, String name,
      String gender, String dob) async {
    final data = {
      'name': name,
      'gender': gender,
      'dob': dob,
      // 'nationality': nationality
    };
    try {
      _dio.options.headers['x_auth_token'] = authToken;
      final response =
          await _dio.post('${baseUrl}user/update/$userId', data: data);
      print(response.statusMessage);
      // print('UpdateUser=> ${jsonEncode(response.data)}');
      if (response.statusCode == 200) {
        return BaseResponse.fromJson(response.data);
      } else {
        return BaseResponse(
            status: 'error', message: S.current.msg_unknown_error);
      }
    } catch (e) {
      // print('error $e');
      return BaseResponse(
          status: 'error', message: S.current.msg_unknown_error);
    }
  }
}
