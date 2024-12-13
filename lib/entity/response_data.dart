import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Response {

  Response(
      {required this.data, required this.code, required this.debug_msg, required this.msg})

  @JsonValue("msg")
  String msg;
  @JsonValue("debug_msg")
  String debug_msg;
  @JsonValue("code")
  int code;
  @JsonValue("data")
  ResponseData data;
}

@JsonSerializable()
class ResponseData {
  ResponseData(
      {required this.microsoftCfg, required this.regUser, required this.tokenInfo, required this.userInfo})

  @JsonValue("token_info")
  TokenInfo tokenInfo;
  @JsonValue("reg_user")
  bool regUser;
  @JsonValue("userinfo")
  UserInfo userInfo;
  @JsonValue("microsoft_cfg")
  MicrosoftCfg microsoftCfg;
}

@JsonSerializable()
class TokenInfo {
  TokenInfo(
      {required this.accessToken, required this.expireTime, required this.refreshTime, required this.userInfo})

  @JsonValue("access_token")
  String accessToken;
  @JsonValue("refresh_time")
  int refreshTime;
  @JsonValue("expire_time")
  int expireTime;
  @JsonValue("userinfo")
  UserInfo userInfo;
}

@JsonSerializable()
class UserInfo {
  // int uid;
  // bool is_new;

}

@JsonSerializable()
class MicrosoftCfg {
  // String speechRegion;
  // String speechKey;

}


