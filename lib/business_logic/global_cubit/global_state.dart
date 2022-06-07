part of 'global_cubit.dart';

@immutable
abstract class GlobalStates {}

class GlobalInitial extends GlobalStates {}
class GlobalLoginSuccess extends GlobalStates {
 final AuthModel accountModel ;
  GlobalLoginSuccess(this.accountModel);
}
class GlobalLoginLoading extends GlobalStates {}
class GlobalLoginError extends GlobalStates {
 final String error;
  GlobalLoginError(this.error);
}
class GlobalRegisterLoading extends GlobalStates {}
class GlobalRegisterSuccess extends GlobalStates {
 final AuthModel accountModel ;
  GlobalRegisterSuccess(this.accountModel);
}
class GlobalRegisterError extends GlobalStates {
 final String error;
  GlobalRegisterError(this.error);
}
class GlobalChangePage extends GlobalStates {}
class LoginChangeState extends GlobalStates {}
class RegisterChangeState extends GlobalStates {}

