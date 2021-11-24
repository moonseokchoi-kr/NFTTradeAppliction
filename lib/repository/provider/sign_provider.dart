//TODO: 회원가입 및 로그인 정보 서비스 만들기
//TODO: 회원가입 성공화면 만들기, Favortie화면 수정하기

import 'package:application/models/sign_in/sign_in_requset.dart';
import 'package:application/models/sign_in/sign_in_response.dart';
import 'package:application/models/sign_up/sign_up_requset.dart';
import 'package:application/models/sign_up/sign_up_response.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

class MoonStoneSignServiceProvider {
  Client client = Client();
  final _uri = Uri.parse("");
  Future<SignUpResponse> SignUp(SignUpRequset req) async {
    print('entered sign_up');
    final response = await client.post(_uri, body: jsonEncode(req.toJson()));
    print(response.body.toString());
    if (200 == response.statusCode) {
      return signUpResponseFromJson(jsonDecode(response.body));
    } else {
      return signUpResponseFromJson(jsonDecode(response.body));
    }
  }

  Future<SignInResponse> SignIn(SignInRequest req) async {
    print('entered sign_in');

    final response = await client.post(_uri, body: jsonEncode(req.toJson()));
    print(response.body.toString());
    if (200 == response.statusCode) {
      return signInResponseFromJson(jsonDecode(response.body));
    } else {
      return signInResponseFromJson(jsonDecode(response.body));
    }
  }
}
