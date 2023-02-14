import '../models/response/auth/login_otp_verify_response.dart';

abstract class AuthDataSource {
  // Stream<User?> get authStateChanges;

  Future<User?> init();

  bool get keepLoggedIn;
  set keepLoggedIn(bool check);

  User? getUser();

  Future<String?> register(String name, String email, String password,
      String phone, String gender, DateTime dob);

  Future<String?> submitRegisterOTP(String phone, String otp);

  Future<String?> resendRegisterOTP(String phone);

  Future<String?> signIn(String email, String password, bool remember);

  Future<String?> signInMobile(String mobile, bool remember);

  Future<String?> verifyMobileOtp(String mobile, String otp);

  Future<bool> signOut();

  Future<String?> forgotPassword(String phone);

  Future<String?> verifyForgetOTP(String phone, String otp);

  Future<String?> changePassword(
      String phone, String password, String confirmPassword);
}



// Name : Create User Api
// 	Url:  https://www.marinaworld.com.kw/api/user/create
// 	Parameter : {
// 		“name” : “ABC”,
// 		“email” : “mailto:abc@gmail.com”,
// 		“password” : ”ABC12331”,
// 		“phone”:”12345678”,
// 		“gender”:”male”,
// 		“dob”:”22-12-2022”,
// 		“nationality”:”IN”,
// 		}

// 	optional filed : gender, dob, nationality



// Name : Reset SMS
// 	Url:  https://www.marinaworld.com.kw/api/user/reset-sms

// 	Parameter : {
// 		“email” : “mailto:abc@gmail.com”
// 	}


// Name : Check OTP
// 	Url:  https://www.marinaworld.com.kw/api/user/checkotp

// 	Parameter : {
// 		“email” : “mailto:abc@gmail.com”,
// 		“otp”:”123456”
// 	}
	
