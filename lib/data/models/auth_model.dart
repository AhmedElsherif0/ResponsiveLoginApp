import 'package:magdsoft_flutter_structure/data/models/account_model.dart';

class AuthModel {
  int? status;
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
    accountModel = (json['account'] != null ? AccountModel.fromJson(json['account']): null)!;
  }
}
