class PhoneNumberScreenModel {
  int? id;
  dynamic name;
  dynamic email;
  int? countryId;
  String? phone;
  dynamic phoneVerifiedAt;
  dynamic avatar;
  dynamic approvedAt;
  dynamic detailsType;
  dynamic detailsId;
  int? profileStatusId;
  int? reviewCount;
  String? reviewRating;
  String? createdAt;
  String? updatedAt;

  PhoneNumberScreenModel({this.id, this.name, this.email, this.countryId, this.phone, this.phoneVerifiedAt, this.avatar, this.approvedAt, this.detailsType, this.detailsId, this.profileStatusId, this.reviewCount, this.reviewRating, this.createdAt, this.updatedAt});

  PhoneNumberScreenModel.fromJson(Map<String, dynamic> json) {
    id = (json["id"] as num).toInt();
    name = json["name"];
    email = json["email"];
    countryId = (json["country_id"] as num).toInt();
    phone = json["phone"];
    phoneVerifiedAt = json["phone_verified_at"];
    avatar = json["avatar"];
    approvedAt = json["approved_at"];
    detailsType = json["details_type"];
    detailsId = json["details_id"];
    profileStatusId = (json["profile_status_id"] as num).toInt();
    reviewCount = (json["review_count"] as num).toInt();
    reviewRating = json["review_rating"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["email"] = email;
    data["country_id"] = countryId;
    data["phone"] = phone;
    data["phone_verified_at"] = phoneVerifiedAt;
    data["avatar"] = avatar;
    data["approved_at"] = approvedAt;
    data["details_type"] = detailsType;
    data["details_id"] = detailsId;
    data["profile_status_id"] = profileStatusId;
    data["review_count"] = reviewCount;
    data["review_rating"] = reviewRating;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    return data;
  }
}