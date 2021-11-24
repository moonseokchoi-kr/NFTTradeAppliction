// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

SignUpRequset signUpRequsetFromJson(String str) =>
    SignUpRequset.fromJson(json.decode(str));

String signUpRequsetToJson(SignUpRequset data) => json.encode(data.toJson());

class SignUpRequset {
  SignUpRequset({
    platform,
    info,
  });

  late String _platform;
  late Info _info;

  factory SignUpRequset.fromJson(Map<String, dynamic> json) => SignUpRequset(
        platform: json["platform"],
        info: Info.fromJson(json["info"]),
      );

  Map<String, dynamic> toJson() => {
        "platform": _platform,
        "info": _info.toJson(),
      };
}

class Info {
  Info({
    token,
    userId,
    password,
  });

  late String _token;
  late String _userId;
  late String _password;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        token: json["token"],
        userId: json["user id"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "token": _token,
        "user id": _userId,
        "password": _password,
      };
}
