class SelectCountryScreenModel {
  String? profileStatus;
  String? role;
  dynamic selectedCountry;
  List<Countries>? countries;

  SelectCountryScreenModel({this.profileStatus, this.role, this.selectedCountry, this.countries});

  SelectCountryScreenModel.fromJson(Map<String, dynamic> json) {
    profileStatus = json["profile_status"];
    role = json["role"];
    selectedCountry = json["selected_country"];
    countries = json["countries"] == null ? null : (json["countries"] as List).map((e) => Countries.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["profile_status"] = profileStatus;
    data["role"] = role;
    data["selected_country"] = selectedCountry;
    if(countries != null) {
      data["countries"] = countries?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Countries {
  int? id;
  String? name;
  String? flag;
  String? image;

  Countries({this.id, this.name, this.flag, this.image});

  Countries.fromJson(Map<String, dynamic> json) {
    id = (json["id"] as num).toInt();
    name = json["name"];
    flag = json["flag"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["flag"] = flag;
    data["image"] = image;
    return data;
  }
}