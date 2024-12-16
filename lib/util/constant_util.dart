import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';

class ConstantUtil{


  static const String KEY_TOKEN = "key_token";
  static const String KEY_USER_EMAIL = "key_user_email";


  static String generateMD5(String data) {
    Uint8List content = const  Utf8Encoder().convert(data);
    Digest digest = md5.convert(content);
    return digest.toString();
  }
}