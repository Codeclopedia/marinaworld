// class ResendOTPResponse {
//   String? message;
//   ResendOtpData? data;
//   String? status;

//   ResendOTPResponse({this.message, this.data, this.status});

//   ResendOTPResponse.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     data = json['data'] != null ? ResendOtpData.fromJson(json['data']) : null;
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = <String, dynamic>{};
//     json['message'] = message;
//     if (data != null) {
//       json['data'] = data?.toJson();
//     }
//     json['status'] = status;
//     return json;
//   }
// }

// class ResendOtpData {
//   String? email;
//   String? sms;

//   ResendOtpData({this.email, this.sms});

//   ResendOtpData.fromJson(Map<String, dynamic> json) {
//     email = json['email'];
//     sms = json['sms'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['email'] = email;
//     data['sms'] = sms;
//     return data;
//   }
// }
