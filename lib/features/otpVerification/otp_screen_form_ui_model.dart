class OtpScreenModel {
  String? profileStatus;
  String? role;
  String? phone;
  String? phoneVerifiedAt;
  String? accessToken;
  String? tokenType;
  int? expiresIn;

  OtpScreenModel({this.profileStatus, this.role, this.phone, this.phoneVerifiedAt, this.accessToken, this.tokenType, this.expiresIn});

  OtpScreenModel.fromJson(Map<String, dynamic> json) {
    profileStatus = json["profile_status"];
    role = json["role"];
    phone = json["phone"];
    phoneVerifiedAt = json["phone_verified_at"];
    accessToken = json["access_token"];
    tokenType = json["token_type"];
    expiresIn = (json["expires_in"] as num).toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["profile_status"] = profileStatus;
    data["role"] = role;
    data["phone"] = phone;
    data["phone_verified_at"] = phoneVerifiedAt;
    data["access_token"] = accessToken;
    data["token_type"] = tokenType;
    data["expires_in"] = expiresIn;
    return data;
  }
}