// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

SignUpResponse signUpResponseFromJson(String str) =>
    SignUpResponse.fromJson(json.decode(str));

class SignUpResponse {
  SignUpResponse({
    result,
    walletAddress,
  });

  late bool result;
  late String walletAddress;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        result: json["result"],
        walletAddress: json["wallet address"],
      );
}
