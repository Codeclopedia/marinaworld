class LoginOTPResponse {
  String? message;
  LoginOTPData? data;
  String? status;

  LoginOTPResponse({this.message, this.data, this.status});

  LoginOTPResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? LoginOTPData.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['message'] = message;
    if (data != null) {
      json['data'] = data?.toJson();
    }
    json['status'] = status;
    return json;
  }
}

class LoginOTPData {
  String? phone;
  String? sms;

  LoginOTPData({this.phone, this.sms});

  LoginOTPData.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    sms = json['sms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['sms'] = sms;
    return data;
  }
}
