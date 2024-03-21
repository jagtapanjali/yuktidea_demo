class TermsConditionScreenModel {
  int? id;
  String? title;
  String? content;
  String? publishedAt;
  int? enabled;
  String? createdAt;
  String? updatedAt;

  TermsConditionScreenModel({this.id, this.title, this.content, this.publishedAt, this.enabled, this.createdAt, this.updatedAt});

  TermsConditionScreenModel.fromJson(Map<String, dynamic> json) {
    id = (json["id"] as num).toInt();
    title = json["title"];
    content = json["content"];
    publishedAt = json["published_at"];
    enabled = (json["enabled"] as num).toInt();
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["content"] = content;
    _data["published_at"] = publishedAt;
    _data["enabled"] = enabled;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}