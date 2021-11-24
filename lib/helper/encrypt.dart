import 'package:encrypt/encrypt.dart';

class Encrypt {
  late IV _iv;
  late Key _key;
  late Encrypter _encrypter;
  late Encrypted _encrypted;
  static final Encrypt _instance = Encrypt._internal();

  factory Encrypt() {
    return _instance;
  }

  String encryptSalso20(String password) {
    _encrypted = _encrypter.encrypt(password, iv: _iv);

    return _encrypted.base64;
  }

  String decryptSalso20() {
    return _encrypter.decrypt(_encrypted, iv: _iv);
  }

  Encrypt._internal() {
    _iv = IV.fromLength(8);
    _key = Key.fromLength(32);
    _encrypter = Encrypter(Salsa20(_key));
  }
}
