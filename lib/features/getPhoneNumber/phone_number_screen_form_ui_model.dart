class PhoneNumberScreenModel {
  int? id;
  String? name;
  String? code;
  String? telCode;
  dynamic timezone;
  String? flag;
  String? createdAt;
  String? updatedAt;

  PhoneNumberScreenModel({this.id, this.name, this.code, this.telCode, this.timezone, this.flag, this.createdAt, this.updatedAt});

  PhoneNumberScreenModel.fromJson(Map<String, dynamic> json) {
    id = (json["id"] as num).toInt();
    name = json["name"];
    code = json["code"];
    telCode = json["tel_code"];
    timezone = json["timezone"];
    flag = json["flag"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["code"] = code;
    data["tel_code"] = telCode;
    data["timezone"] = timezone;
    data["flag"] = flag;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    return data;
  }
}