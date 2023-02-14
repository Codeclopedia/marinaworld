
class RegisterSMSResponse {
  String? message;
  RegisterData? data;
  String? status;

  RegisterSMSResponse({this.message, this.data, this.status});

  RegisterSMSResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? RegisterData.fromJson(json['data']) : null;
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

class RegisterData {
  String? phone;
  String? sms;

  RegisterData({this.phone, this.sms});

  RegisterData.fromJson(Map<String, dynamic> json) {
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
