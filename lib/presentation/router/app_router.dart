import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/constants_values.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/home/home_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/login_screen.dart';

import '../screens/shared/splash_screen.dart';
import '../screens/user/register_screen.dart';

class AppRouter {
 static Route? onGenerateRoute(RouteSettings settings) {
    List<AccountModel> accountModel = [] ;
    switch (settings.name) {
      case Constants.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Constants.loginUserScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Constants.registerUserScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Constants.homeScreen:
        return MaterialPageRoute(
            builder: (_) => HomeScreen(accountModel: accountModel));
      default:
        return null;
    }
  }
}
