class PaymentRequest {
  int paidAmount;

  PaymentRequest({required this.paidAmount});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["paid_amount"] = this.paidAmount;
    data["payment_token"] = "hello";
    return data;
  }
}
