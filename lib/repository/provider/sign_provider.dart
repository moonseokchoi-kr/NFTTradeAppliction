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
  String _url = "http://13.125.152.144:5555";

  final header = {
    "Content-type": "application/json",
  };
  Future<SignUpResponse> SignUp(SignUpRequset req) async {
    print('entered sign_up');
    final uri = Uri.parse(_url + "/user/register");
    final body = jsonEncode(req.toJson());
    //final test =
    //    """{ "platform" : "google", "userinfo" :{ "token" : "", "email" : "hellssowordsdld@bye.com", "user_id" : "10101023112323", "password" : "email" }}""";
    print(body);
    final response = await client.post(uri, headers: header, body: body);
    print(response.body.toString());
    if (200 == response.statusCode) {
      return signUpResponseFromJson(response.body);
    } else {
      return signUpResponseFromJson(response.body);
    }
  }

  Future<SignInResponse> SignIn(SignInRequest req) async {
    print('entered sign_in');
    final uri = Uri.parse(_url + "/user/validation");
    final body = jsonEncode(req.toJson());

    print(body);
    final response = await client.post(uri, headers: header, body: body);
    print(response.body.toString());
    if (200 == response.statusCode) {
      return signInResponseFromJson(response.body);
    } else {
      return signInResponseFromJson(response.body);
    }
  }
}
