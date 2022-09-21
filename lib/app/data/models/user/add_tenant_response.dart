class AddTenantResponse {
  bool? success;
  String? message;
  // Data? data;
  late List<dynamic> errors;
  Meta? meta;

  AddTenantResponse.fromJson(Map<String, dynamic> json) {
    this.success = json["success"];
    this.message = json["message"];
    // this.data = json["data"] == null ? null : Data.fromJson(json["data"]);
    this.errors = json["errors"] ?? [];
    this.meta = json["meta"] == null ? null : Meta.fromJson(json["meta"]);
  }
}

class Meta {
  int? tenantId;
  String? owner;
  String? tenant;

  Meta({this.tenantId, this.owner, this.tenant});

  Meta.fromJson(Map<String, dynamic> json) {
    this.tenantId = json["tenant_id"];
    this.owner = json["owner"];
    this.tenant = json["tenant"];
  }
}
