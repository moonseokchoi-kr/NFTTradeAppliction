// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:application/models/sign_in/sigin_in_error.dart';

SignUpResponse signUpResponseFromJson(String str) =>
    SignUpResponse.fromJson(json.decode(str));

class SignUpResponse {
  SignUpResponse({
    required this.result,
    required this.walletAddress,
    required this.error,
  });

  bool result;
  String walletAddress;
  ServiceError error;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        result: json["result"] == "true" ? true : false,
        walletAddress:
            json["wallet address"] == "" ? "" : json["wallet address"],
        error: json["result"] == null
            ? ServiceError.fromJson(json)
            : ServiceError(error: "", path: "", timestamp: DateTime.now()),
      );
}
