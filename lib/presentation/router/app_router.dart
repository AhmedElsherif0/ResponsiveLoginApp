import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/constants_values.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/home/home_screen.dart';

import '../screens/shared/splash_screen.dart';
import '../screens/user/user_profile.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    List<AccountModel> accountModel = [] ;
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case userProfileScreen:
        return MaterialPageRoute(builder: (_) => const UserProfile());
      case homeScreen:
        return MaterialPageRoute(
            builder: (_) => HomeScreen(accountModel: accountModel));
      default:
        return null;
    }
  }
}
