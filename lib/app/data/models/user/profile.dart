class ProfileResponse {
  bool? success;
  String? message;
  Profile? data;
  late List<dynamic> errors;
  Meta? meta;

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    this.success = json["success"];
    this.message = json["message"];
    this.data = json["data"] == null ? null : Profile.fromJson(json["data"]);
    this.errors = json["errors"] ?? [];
    this.meta = json["meta"] == null ? null : Meta.fromJson(json["meta"]);
  }
}

class Meta {
  Meta();

  Meta.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    return data;
  }
}

class Profile {
  int? id;
  String? email;
  bool? isActive;
  bool? isOwner;
  String? phoneNumber;
  String? firstName;
  String? lastName;
  dynamic image;

  Profile({
    this.id,
    this.email,
    this.isActive,
    this.isOwner,
    this.phoneNumber,
    this.firstName,
    this.lastName,
    this.image,
  });

  Profile.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.email = json["email"];
    this.isActive = json["is_active"];
    this.isOwner = json["is_owner"];
    this.phoneNumber = json["phone_number"];
    this.firstName = json["first_name"];
    this.lastName = json["last_name"];
    this.image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["email"] = this.email;
    data["is_active"] = this.isActive;
    data["is_owner"] = this.isOwner;
    data["phone_number"] = this.phoneNumber;
    data["first_name"] = this.firstName;
    data["last_name"] = this.lastName;
    data["image"] = this.image;
    return data;
  }
}
