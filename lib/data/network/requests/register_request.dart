
import '../../models/auth_model.dart';

abstract class RegisterRepository {
  Future<AuthModel> postRegisterUser(
      String name, String phone, String email, String password);
}
