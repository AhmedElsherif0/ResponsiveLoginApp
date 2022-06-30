import 'package:dio/dio.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/register_request.dart';
import '../../../constants/end_points.dart';
import '../../models/auth_model.dart';
import '../../remote/dio_helper.dart';

class RegisterMockRepo extends RegisterRepository{

  @override
  Future<AuthModel> postRegisterUser(
      String name, String phone, String email, String password) async {
    AuthModel _authModel = AuthModel();
    Response successData = await DioHelper.postData(url: registerEndPoint, body: {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password
    });
    _authModel =  AuthModel.fromRegisterJson(successData.data);
    return _authModel;
  }
}
