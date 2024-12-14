class ResponseEntity {
  ResponseEntity(
      this.responseData, this.code, this.debug_msg, this.msg, this.signature);

  String msg;
  String debug_msg;
  String code;
  String signature;
  ResponseData responseData;

  ResponseEntity.fromJson(Map<String, dynamic> json)
      : msg = json['msg'],
        debug_msg = json['debug_msg'],
        code = json['code'],
        signature = json['signature'],
        responseData = ResponseData.fromJson(json['data']);

  Map<String, dynamic> toJson() => {
        'msg': msg,
        'debug_msg': debug_msg,
        'code': code,
        'signature': signature,
        'data': responseData.toJson(),
      };
}

class ResponseData {
  ResponseData(this.microsoftCfg, this.regUser, this.tokenInfo, this.userInfo);

  TokenInfo tokenInfo;
  bool regUser;
  UserInfo userInfo;
  MicrosoftCfg microsoftCfg;

  ResponseData.fromJson(Map<String, dynamic> json)
      : tokenInfo = TokenInfo.fromJson(json['token_info']),
        regUser = json['reg_user'],
        userInfo = UserInfo.fromJson(json['userinfo']),
        microsoftCfg = json['microsoft_cfg'];

  Map<String, dynamic> toJson() => {
        'token_info': tokenInfo.toJson(),
        'reg_user': regUser,
        'userinfo': userInfo.toJson(),
        'microsoft_cfg': microsoftCfg.toJson(),
      };
}

class MicrosoftCfg {
  MicrosoftCfg(this.speechKey, this.uid);

  String speechKey;
  String uid;

  MicrosoftCfg.fromJson(Map<String, dynamic> json)
      : speechKey = json['speechKey'],
        uid = json['uid'];

  Map<String, dynamic> toJson() => {
        'speechKey': speechKey,
        'uid': uid,
      };
}

class TokenInfo {
  TokenInfo(this.accessToken, this.expireTime, this.refreshTime);

  String accessToken;
  String refreshTime;
  String expireTime;

  TokenInfo.fromJson(Map<String, dynamic> json)
      : accessToken = json['access_token'],
        refreshTime = json['refresh_time'],
        expireTime = json['expire_time'];

  Map<String, dynamic> toJson() => {
        'access_token': accessToken,
        'refresh_time': refreshTime,
        'expire_time': expireTime
      };
}

class UserInfo {
  UserInfo(this.isNew, this.uid);

  String uid;
  bool isNew;

  UserInfo.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        isNew = json['is_new'];

  Map<String, dynamic> toJson() => {'uid': uid, 'is_new': isNew};
}
