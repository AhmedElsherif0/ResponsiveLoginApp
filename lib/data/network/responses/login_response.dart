import 'package:magdsoft_flutter_structure/constants/constants_values.dart';
import 'package:magdsoft_flutter_structure/data/local/cache_helper.dart';
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
    print('login response ${successData.data}');
    if (successData.data != null) {
      _authModel = AuthModel.fromLoginJson(successData.data);
    await addUserData(
          _authModel.accountModels[0].email, _authModel.accountModels[0].name,
          _authModel.accountModels[0].phone);
    }
    print('2nd login response ${_authModel.accountModels[0].name}');
    return _authModel;
  }

  @override
  Future addUserData(String? email, String? name, String? phone) async {
    await CacheHelper.saveDataSharedPreference(
        key: Constants.userName, value: name);
    await CacheHelper.saveDataSharedPreference(
        key: Constants.userEmail, value: email);
    await CacheHelper.saveDataSharedPreference(
        key: Constants.userPhone, value: phone);
  }
}
