class GetAgreementResponse {
  bool? success;
  String? message;
  Agreement? data;

  GetAgreementResponse({this.success, this.message, this.data});

  GetAgreementResponse.fromJson(Map<String, dynamic> json) {
    this.success = json["success"];
    this.message = json["message"];
    this.data = json["data"] == null ? null : Agreement.fromJson(json["data"]);
  }
}

class Agreement {
  int? price;
  int? tenant;
  int? internetPrice;
  int? waterUsagePrice;
  int? nagarpalikaFohrPrice;
  int? electricityRate;
  String? picture;
  String? deadline;

  Agreement(
      {this.price,
      this.tenant,
      this.internetPrice,
      this.waterUsagePrice,
      this.nagarpalikaFohrPrice,
      this.electricityRate,
      this.deadline,
      this.picture});

  Agreement.fromJson(Map<String, dynamic> json) {
    this.price = json["price"];
    this.tenant = json["tenant"];
    this.internetPrice = json["internet_price"];
    this.waterUsagePrice = json["water_usage_price"];
    this.nagarpalikaFohrPrice = json["nagarpalika_fohr_price"];
    this.electricityRate = json["electricity_rate"];
    this.picture = json["picture"];
    this.deadline = json["deadline"];
  }
}
