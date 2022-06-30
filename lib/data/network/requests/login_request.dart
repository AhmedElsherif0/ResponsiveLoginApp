import '../../models/auth_model.dart';

abstract class LoginRepository {
  Future<AuthModel> postLoginUser(String email, String password);
  Future addUserData(String email, String name,String phone);
}
