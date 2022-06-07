import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/constants/enum_global_authentication.dart';
import 'package:magdsoft_flutter_structure/data/models/auth_model.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/login_request.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/register_request.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/login_response.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/register_response.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalStates> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  final LoginRepository _loginRepository = LoginMockRepo();
  final RegisterRepository _registerRepository = RegisterMockRepo();

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
      print('Cubit login error  ${error.toString()}');
      emit(GlobalLoginError(error.toString()));
    }
  }

  void registerUser(
      String name, String phone, String email, String password) async {
    AuthModel _authModel = AuthModel();
    emit(GlobalRegisterLoading());
    try {
      _authModel = await _registerRepository.postRegisterUser(
          name, phone, email, password);
      print('Cubit data response ${_authModel.accountModel}');
      emit(GlobalRegisterSuccess(_authModel));
    } catch (error) {
      print('Cubit register error ${error.toString()}');
      emit(GlobalRegisterError(error.toString()));
    }
  }


  bool isPasswordRegistered = true;
  bool isPasswordConfirmRegister = true;
  bool isPasswordLogin = true;

/*
  void changeLoginPassword(bool isPassword) {
    emit(LoginChangeState());
    print('changePassword$isPassword') ;
  }*/

  void changeRegisterPassword(bool isPassword) {
    emit(RegisterChangeState());
    print('changePassword$isPassword') ;
  }

}
