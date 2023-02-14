class LoginOTPVerifyResponse {
  User? body;
  String? status;
  String? message;
  LoginOTPVerifyResponse({this.body, this.status, this.message});

  LoginOTPVerifyResponse.fromJson(Map<String, dynamic> json) {
    body = json['body'] != null ? User.fromJson(json['body']) : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (body != null) {
      data['body'] = body!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class User {
  int? id;
  String? authToken;
  String? name;
  String? email;
  String? phone;
  String? role;

  User(
      {this.id,
      this.authToken,
      this.name,
      this.email,
      this.phone,
      this.role});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    authToken = json['auth_token'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['auth_token'] = authToken;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['role'] = role;
    return data;
  }
}
