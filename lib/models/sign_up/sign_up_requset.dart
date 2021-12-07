// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

SignUpRequset signUpRequsetFromJson(String str) =>
    SignUpRequset.fromJson(json.decode(str));

String signUpRequsetToJson(SignUpRequset data) => json.encode(data.toJson());

class SignUpRequset {
  SignUpRequset({
    required this.platform,
    required this.info,
  });

  String platform;
  Info info;

  factory SignUpRequset.fromJson(Map<String, dynamic> json) => SignUpRequset(
        platform: json["platform"],
        info: Info.fromJson(json["info"]),
      );

  Map<String, dynamic> toJson() => {
        "platform": platform,
        "user_info": info.toJson(),
      };
}

class Info {
  Info({
    required this.token,
    required this.userId,
    required this.email,
    required this.password,
  });

  String token;
  String userId;
  String email;
  String password;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        token: json["token"],
        userId: json["user_id"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user_id": userId,
        "email": email,
        "password": password,
      };
}
