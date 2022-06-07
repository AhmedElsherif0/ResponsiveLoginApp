import 'package:magdsoft_flutter_structure/data/models/auth_model.dart';

import '../../../constants/end_points.dart';
import '../../remote/dio_helper.dart';
import '../requests/login_request.dart';

class LoginMockRepo extends LoginRepository {

  @override
  Future<AuthModel> postLoginUser(String email, String password) async {
    AuthModel _authModel = AuthModel();
    final successData = await DioHelper.postData(
        url: loginEndPoint, body: {'email': email, 'password': password});
     _authModel = AuthModel.fromLoginJson(successData.data);
     print('login response ${_authModel.accountModels[0].name}');
    return _authModel;
  }
}