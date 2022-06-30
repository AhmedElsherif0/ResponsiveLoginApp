import 'package:magdsoft_flutter_structure/data/models/account_model.dart';

class AuthModel {
  int? status;
  String? message ;
  List<AccountModel> accountModels = [];
  AccountModel? accountModel = AccountModel() ;

  AuthModel();

  AuthModel.fromLoginJson(Map<String, dynamic> json) {
    status = json['status'];
    accountModels = List<AccountModel>.from(
        json['account'].map((e) => AccountModel.fromJson(e)).toList());
  }

  AuthModel.fromRegisterJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
