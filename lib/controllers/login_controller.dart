import 'package:application/models/sign_in/sign_in_requset.dart';
import 'package:application/models/sign_in/sign_in_response.dart';
import 'package:application/models/sign_up/sign_up_requset.dart';
import 'package:application/models/sign_up/sign_up_response.dart';
import 'package:application/repository/sign_repository.dart';
import 'package:application/screens/sign_in/account_screen.dart';
import 'package:application/screens/splash/splash_screen.dart';
import 'package:application/screens/wallet/wallet_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:jwt_decode/jwt_decode.dart';

class LoginService extends GetxService {
  FirebaseApp? firebaseApp;
  FirebaseAuth? firebaseAuth;
  User? firebaseUser;
  MoonStoneSignServiceRepository _repository = MoonStoneSignServiceRepository();

  Future<void> initializeFirebaseApp() async {
    firebaseApp = await Firebase.initializeApp();
  }

  Future<Widget> checkSignedIn() async {
    if (firebaseApp == null) await initializeFirebaseApp();
    if (firebaseAuth == null) firebaseAuth = FirebaseAuth.instance;
    if (firebaseUser != null) {
      return WalletScreen();
    }
    bool init = null != Hive.box('initApp').get('init') ? true : false;
    if (init)
      return SignInScreen();
    else
      return SplashScreen();
  }

  Future<bool> signUpMoonstone() async {
    final id = Hive.box('initApp').get('user_id');
    final pwd = Hive.box('initApp').get('password');
    final token = Hive.box('initApp').get('google_access_token');
    final email = Hive.box('initApp').get('email');
    SignUpRequset requset = SignUpRequset(
        platform: 'google',
        info: Info(
          userId: id,
          email: email,
          password: pwd,
          token: token,
        ));
    SignUpResponse response = await _repository.SignUpMoonStone(requset);
    if (response.result)
      Hive.box('initApp').put('user_wallet', response.walletAddress);
    return response.result;
  }

  Future<bool> signInWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/userinfo.profile',
      ],
    );
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print("id : ${googleUser?.id}");
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    print("accessToken: ${googleAuth?.accessToken}");
    // String token =
    //     "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbnlvbmcyMzI3QGdtYWlsLmNvbSIsInJvbGUiOiJVU0VSIiwiaWF0IjoxNjM3MTEzNjYxLCJleHAiOjE2MzcxMTQ1NjF9.FYZ6ijsd7saYbIryjPo_QJV0E2JEA1xnrxmrj8pumnM";

    // Map<String, dynamic> payload = Jwt.parseJwt(token);

    // print(payload);

    // check the user exisit in server
    // if accesstoken value is null return error message
    Hive.box('initApp').put('google_access_token', googleAuth?.accessToken);
    Hive.box('initApp').put('email', googleUser?.email);
    if (null == googleUser) {
      //다이얼로그 출력
      Get.off(SignInScreen.routeName);
    } else {}
    SignInRequest req = SignInRequest(
        platform: 'google',
        user: SnsUser(
          id: "108511158565396470490",
          token: googleAuth!.accessToken!,
        ));
    SignInResponse response = await _repository.SignInMoonStone(req);

    Hive.box('initApp').put('moonstone_access_token', response.token);

    return response.result;

    // final id = Hive.box('initApp').get('user_id');
    // final pwd = Hive.box('initApp').get('password');

    // if (null != id && null != pwd) return true;
    // return false;
  }

  void parseJwtToken() {
    //jwt 데이터 확정되면 walletuser를 service에 생성하고 저장
  }
  Future<void> signOut() async {
    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
    await GoogleSignIn().signOut();
  }
}
