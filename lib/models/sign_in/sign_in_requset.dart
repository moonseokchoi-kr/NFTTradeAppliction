// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

SignInRequest signInRequsetFromJson(String str) =>
    SignInRequest.fromJson(json.decode(str));

String signInRequsetToJson(SignInRequest data) => json.encode(data.toJson());

class SignInRequest {
  SignInRequest({
    required this.platform,
    required this.user,
  });

  String platform;
  SnsUser user;

  factory SignInRequest.fromJson(Map<String, dynamic> json) => SignInRequest(
        platform: json["platform"],
        user: SnsUser.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "platform": platform,
        "user": user.toJson(),
      };
}

class SnsUser {
  SnsUser({
    required this.id,
    required this.token,
  });

  String id;
  String token;

  factory SnsUser.fromJson(Map<String, dynamic> json) => SnsUser(
        id: json["id"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
      };
}
