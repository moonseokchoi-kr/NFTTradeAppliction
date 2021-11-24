import 'package:application/models/sign_in/sign_in_requset.dart';
import 'package:application/models/sign_in/sign_in_response.dart';
import 'package:application/models/sign_up/sign_up_requset.dart';
import 'package:application/models/sign_up/sign_up_response.dart';
import 'package:application/repository/provider/sign_provider.dart';

class MoonStoneSignServiceRepository {
  final provider = MoonStoneSignServiceProvider();
  Future<SignUpResponse> SignUpMoonStone(SignUpRequset req) =>
      provider.SignUp(req);
  Future<SignInResponse> SignInMoonStone(SignInRequest req) =>
      provider.SignIn(req);
}
