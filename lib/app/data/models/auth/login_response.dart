class LoginResponse {
  late String key;

  LoginResponse({required this.key});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    this.key = json["key"];
  }
}
