// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

SignInRequest signInRequsetFromJson(String str) =>
    SignInRequest.fromJson(json.decode(str));

String signInRequsetToJson(SignInRequest data) => json.encode(data.toJson());

class SignInRequest {
  SignInRequest({
    platform,
    user,
  });

  late String _platform;
  late SnsUser _user;

  factory SignInRequest.fromJson(Map<String, dynamic> json) => SignInRequest(
        platform: json["platform"],
        user: SnsUser.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "platform": _platform,
        "user": _user.toJson(),
      };
  String get platform => _platform;
  SnsUser get user => _user;
}

class SnsUser {
  SnsUser({
    id,
    token,
  });

  late int _id;
  late String _token;

  factory SnsUser.fromJson(Map<String, dynamic> json) => SnsUser(
        id: json["id"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": _id,
        "token": _token,
      };

  int get id => _id;
  String get token => _token;
}
