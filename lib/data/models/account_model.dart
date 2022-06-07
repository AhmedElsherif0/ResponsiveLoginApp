class AccountModel {
  int? id;
  String? email;
  String? password;
  String? phone;
  String? name;

  AccountModel();

  AccountModel.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    email = json?["email"];
    password = json?["password"];
    phone = json?["phone"];
    name = json?["name"];
  }
}
