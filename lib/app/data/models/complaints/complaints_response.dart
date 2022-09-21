class ComplaintsResponse {
  bool? success;
  String? message;
  late List<Complaint> complaints;
  late List<dynamic> errors;
  Meta? meta;
  String? messgae;

  ComplaintsResponse.fromJson(Map<String, dynamic> json) {
    if (json["success"] is bool) this.success = json["success"];
    if (json["message"] is String) this.message = json["message"];
    this.complaints = json["data"] == null
        ? []
        : (json["data"] as List).map((e) => Complaint.fromJson(e)).toList();
    this.errors = json["errors"] ?? [];
    this.meta = json["meta"] == null ? null : Meta.fromJson(json["meta"]);
    if (json["messgae"] is String) this.messgae = json["messgae"];
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

class Complaint {
  int? id;
  String? image;
  String? title;
  String? description;
  String? date;
  String? urgencyLevel;
  int? tenant;
  String? status;
  bool? isSolved;

  Complaint(
      {this.id,
      this.image,
      this.title,
      this.description,
      this.date,
      this.urgencyLevel,
      this.isSolved,
      this.status,
      this.tenant});

  Complaint.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["image"] is String) this.image = json["image"];
    if (json["title"] is String) this.title = json["title"];
    if (json["description"] is String) this.description = json["description"];
    this.date = json["date"];
    this.urgencyLevel = json["urgency_level"];
    this.tenant = json["tenant"];
    this.status = json["status"];
    this.isSolved = json["is_solved"];
  }
}
