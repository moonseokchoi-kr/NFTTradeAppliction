import 'dart:convert';

import 'package:application/models/sign_in/sigin_in_error.dart';

SignInResponse signInResponseFromJson(String str) =>
    SignInResponse.fromJson(json.decode(str));

class SignInResponse {
  SignInResponse(
      {required this.result, required this.token, required this.error});

  bool result;
  String token;
  ServiceError error;

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
        result: json["result"] == "true" ? true : false,
        token: json["token"] == null ? "" : json["token"],
        error: json["result"] == null
            ? ServiceError.fromJson(json)
            : ServiceError(error: "", path: "", timestamp: DateTime.now()),
      );
}
