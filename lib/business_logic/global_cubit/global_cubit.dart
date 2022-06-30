import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:magdsoft_flutter_structure/constants/enum_global_authentication.dart';
import 'package:magdsoft_flutter_structure/data/models/auth_model.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/login_request.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/register_request.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/login_response.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/register_response.dart';

import '../../data/local/cache_helper.dart';
import '../../data/network/requests/home_request.dart';
import '../../data/network/responses/home_response.dart';
import '../../main.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalStates> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  final LoginRepository _loginRepository = LoginMockRepo();
  final RegisterRepository _registerRepository = RegisterMockRepo();
  final HomeRepository _homeRepository = HomeMockRepo();

  GlobalAuth _changeAuthPage = GlobalAuth.login;

  GlobalAuth get changePage => _changeAuthPage;

  void changeAuthPageState() {
    emit(GlobalLoginLoading());
    if (changePage == GlobalAuth.login) {
      _changeAuthPage = GlobalAuth.register;
      emit(GlobalChangePage());
    } else {
      _changeAuthPage = GlobalAuth.login;
      emit(GlobalChangePage());
    }
  }

  void loginUser(String email, String password) async {
    AuthModel _authModel = AuthModel();
    emit(GlobalLoginLoading());
    try {
      _authModel = await _loginRepository.postLoginUser(email, password);

      emit(GlobalLoginSuccess(_authModel));
    } catch (error) {
      emit(GlobalLoginError(error.toString()));
    }
  }

  clearUserData() {
    _homeRepository.clearData();
    emit(HomeClearDataState());
  }

  void registerUser(
      String name, String phone, String email, String password) async {
    AuthModel _authModel = AuthModel();
    emit(GlobalRegisterLoading());
    try {
      _authModel = await _registerRepository.postRegisterUser(
          name, phone, email, password);
      emit(GlobalRegisterSuccess(_authModel));
    } catch (error) {
      emit(GlobalRegisterError(error.toString()));
    }
  }

  bool isPasswordRegistered = true;
  bool isPasswordConfirmRegister = true;
  bool isPasswordLogin = true;

  void changeLoginPassword(bool isPassword) {
    isPasswordLogin = !isPasswordLogin;
    emit(LoginChangeState());
  }

  void changeRegisterPassword(bool isPassword) {
    isPasswordRegistered = !isPasswordRegistered;
    emit(RegisterChangeState());
  }

  void changeConfirmRegisterPassword(bool isPassword) {
    isPasswordConfirmRegister = !isPasswordConfirmRegister;
    emit(RegisterConfirmChangeState());
  }

  localizationChange(BuildContext context) async {
    await CacheHelper.saveDataSharedPreference(
        key: 'language', value: localizationDelegate.currentLocale.languageCode);
    await changeLocale(
        context, localizationDelegate.currentLocale.languageCode == 'ar' ? 'en' : 'ar');
    emit(LocalizationChangeState());
  }
}
