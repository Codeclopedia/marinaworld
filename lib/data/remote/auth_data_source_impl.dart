import 'dart:async';
import 'dart:convert';

import 'package:intl/intl.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '/data/models/response/auth/register_sms_response.dart';
import '/core/ui_core.dart';
// import '/data/models/response/base_response.dart';
import '../models/models.dart';
// import '../models/response/auth/register_response.dart';
import '../network/api_service.dart';
import 'auth_data_source.dart';

class AuthDataSourceImpl extends AuthDataSource {
  final ApiService api;

  final StreamController<User?> _controller = StreamController();

  User? _user;
  bool _keepLoggedIn = true;

  AuthDataSourceImpl({required this.api}) {
    init();
  }
  @override
  bool get keepLoggedIn => _keepLoggedIn;

  @override
  Future<User?> init() async {
    // _controller.onResume;
    // print("init called");
    final pref = await SharedPreferences.getInstance();
    _keepLoggedIn = pref.getBool("remember") ?? true;
    final userStr = pref.getString("user");
    if (userStr != null && userStr.isNotEmpty && _keepLoggedIn) {
      // print("User:$userStr");
      final user = User.fromJson(jsonDecode(userStr));
      // _controller.add(user);
      _user = user;

      return user;
    }
    // await Future.delayed(const Duration(seconds: 2));
    return null;
  }

  @override
  User? getUser() {
    return _user;
  }

  @override
  Future<String?> signIn(String email, String password, bool remember) async {
    LoginResponse? response = await api.login(email, password);
    final pref = await SharedPreferences.getInstance();
    if (response.status == 'success' && response.body != null) {
      if (response.body?.authToken != null) {
        _user = response.body;
        try {
          _keepLoggedIn = remember;
          await pref.setBool("remember", remember);
          if (_user != null && _keepLoggedIn) {
            // await pref.setString("register_email", '');
            await pref.setString("user", jsonEncode(_user!.toJson()));
          }
          return null;
        } catch (_) {}
      } else {
        _user = null;
        await pref.clear();
        return "Account not activated yet";
      }
      return null;
    }
    _user = null;
    await pref.clear();
    return response.message ?? "Error while logging In";
  }

  @override
  Future<bool> signOut() async {
    final pref = await SharedPreferences.getInstance();
    await pref.clear();
    _user = null;
    _controller.add(_user);
    return true;
  }

  @override
  set keepLoggedIn(bool check) {
    _keepLoggedIn = check;
  }

  @override
  Future<String?> register(String name, String email, String password,
      String phone, String gender, DateTime dob, String nationality) async {
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
    RegisterResponse response = await api.register(
        name, email, password, phone, gen, dobStr, nationality);

    if (response.status == 'success' && response.data != null) {
      final pref = await SharedPreferences.getInstance();
      await pref.setString(
          "register_user", jsonEncode(response.data!.toJson()));
      // if (response.data?.sms == 'success') {
      //   return null;
      // } else {
      //   return await resendOTP(phone);
      // }
      return null;
    }
    return response.message ?? "Error while register";
  }

  setUser() {}

// {
//     "message": "The email has already been taken.",
//     "status": "error"
// }

//   {
//     "message": "User Created Successfully.",
//     "data": {
//         "email": "test@gmail.com",
//         "sms": "failed"
//     },
//     "status": "success"
// }
// {
//     "message": "User Created Successfully.",
//     "data": {
//         "email": "rosh.michel7@gmail.com",
//         "sms": "success"
//     },
//     "status": "success"
// }

  @override
  Future<String?> resendRegisterOTP(String phone) async {
    if (_user?.authToken != null) {
      return null;
    }
    RegisterSMSResponse response = await api.sendOtp(phone);
    if (response.status == 'success' && response.data != null) {
      // await (await SharedPreferences.getInstance())
      //     .setString("register_email", email);
      if (response.data?.sms == 'success') {
        return null;
      } else {
        // return 'Error while sending otp';
      }
    }
    return response.message ?? 'Error while sending otp';
  }
//   {
//     "message": "SMS sent successfully.",
//     "data": {
//         "email": "rosh.michel7@gmail.com",
//         "sms": "success"
//     },
//     "status": "success"
// }

// {
//     "message": "SMS sent failed.",
//     "data": {
//         "email": "test@gmail.com",
//         "sms": "failed"
//     },
//     "status": "failed"
// }

// {
//     "message": "The selected email is invalid.",
//     "status": "error"
// }

  @override
  Future<String?> submitRegisterOTP(String phone, String otp) async {
    BaseResponse response = await api.checkOtp(phone, otp);
    if (response.status == 'success') {
      return null;
    } else {
      return response.message ?? 'Invalid OTP';
    }
  }

  @override
  Future<String?> forgotPassword(String phone) async {
    BaseResponse response = await api.forgotPassword(phone);
    if (response.status == 'success') {
      return null;
    }
    return response.message ?? 'Invalid OTP';
  }

  @override
  Future<String?> verifyForgetOTP(String phone, String otp) async {
    BaseResponse response = await api.verifyForgotOtp(phone, otp);
    if (response.status == 'success') {
      return null;
    } else {
      return response.message ?? 'Invalid OTP';
    }
  }

  @override
  Future<String?> changePassword(
      String phone, String password, String confirmPassword) async {
    BaseResponse response =
        await api.changePassword(phone, password, confirmPassword);
    if (response.status == 'success') {
      return null;
    } else {
      return response.message ?? 'Error in changing password';
    }
  }

  @override
  Future<String?> signInMobile(String mobile, bool remember) async {
    LoginOTPResponse response = await api.loginOtp(mobile);
    if (response.status == 'success') {
      _keepLoggedIn = remember;
      return null;
    } else {
      return response.message ?? 'Invalid OTP';
    }
  }

  @override
  Future<String?> verifyMobileOtp(String mobile, String otp) async {
    LoginOTPVerifyResponse response = await api.verifyLoginOtp(mobile, otp);
    if (response.status == 'success' && response.body != null) {
      final pref = await SharedPreferences.getInstance();
      if (response.body?.authToken != null) {
        _user = response.body;
        try {
          await pref.setBool("remember", _keepLoggedIn);
          if (_user != null && _keepLoggedIn) {
            await pref.setString("user", jsonEncode(_user!.toJson()));
          }
          return null;
        } catch (_) {}
      } else {
        _user = null;
        await pref.clear();
        return "Account not activated yet";
      }
      return null;
    } else {
      return response.message ?? 'Invalid OTP';
    }
  }
//   {
//     "message": "Your OTP is not correct",
//     "status": "error"
// }
}
