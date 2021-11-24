import 'dart:convert';

SignInResponse signInResponseFromJson(String str) =>
    SignInResponse.fromJson(json.decode(str));

class SignInResponse {
  SignInResponse({result, token, error}) {
    _result = result;
    _token = token;
    _error = error;
  }

  late bool _result;
  late String _token;
  late String _error;

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
        result: json["result"],
        token: json["token"],
        error: json["error"],
      );

  bool get result => _result;
  String get token => _token;
  String get error => _error;
}
