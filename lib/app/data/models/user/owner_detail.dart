class OwnerDetailResponse {
  bool? success;
  String? message;
  OwnerDetail? details;

  OwnerDetailResponse({this.success, this.message, this.details});

  OwnerDetailResponse.fromJson(Map<String, dynamic> json) {
    this.success = json["success"];
    this.message = json["message"];
    this.details =
        json["details"] == null ? null : OwnerDetail.fromJson(json["details"]);
  }
}

class OwnerDetail {
  String? firstName;
  String? lastName;
  String? email;
  bool? isActive;
  String? ownerPhoneNumber;

  OwnerDetail(
      {this.firstName,
      this.lastName,
      this.email,
      this.isActive,
      this.ownerPhoneNumber});

  OwnerDetail.fromJson(Map<String, dynamic> json) {
    this.firstName = json["first_name"];
    this.lastName = json["last_name"];
    this.email = json["email"];
    this.isActive = json["is_active"];
    this.ownerPhoneNumber = json["owner_phone_number"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["first_name"] = this.firstName;
    data["last_name"] = this.lastName;
    data["email"] = this.email;
    data["is_active"] = this.isActive;
    data["owner_phone_number"] = this.ownerPhoneNumber;
    return data;
  }
}
