import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/logo_widget.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/register_form_fields.dart';

import '../../../main.dart';
import '../../styles/colors.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth >= 576 && constraints.maxWidth <= 992) {
            return tabletRegisterScreen();
          }
          if (constraints.maxWidth > 992) {
            return desktopRegisterScreen();
          }
          return mobileRegisterScreen();
        },
      )
    );
  }

  Widget mobileRegisterScreen() => Column(
        children: [
          Expanded(
            child: Column(children: const [
              Spacer(),
              LogoWidget(),
              Spacer(),
            ]),
          ),
          const Expanded(
            flex: 3,
            child: RegisterFormFields(),
          ),
        ],
      );
  Widget desktopRegisterScreen() => Row(
        children: [
          Expanded(
            child: Column(children: const [
              Spacer(),
              LogoWidget(),
              Spacer(),
            ]),
          ),
          Expanded(
            flex: 3,
            child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                        left: localizationDelegate.currentLocale.languageCode == 'ar'
                            ? const Radius.circular(50)
                            : const Radius.circular(0.0),
                        right: localizationDelegate.currentLocale.languageCode == 'ar'
                            ? const Radius.circular(0.0)
                            : const Radius.circular(50)),
                    color: AppColor.white),
                child: const RegisterScreen()),
          ),
        ],
      );
  Widget tabletRegisterScreen() => Row(
        children: [
          Expanded(
            child: Column(children: const [
              Spacer(),
              LogoWidget(),
              Spacer(),
            ]),
          ),
          Expanded(
            flex: 3,
            child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                        left: localizationDelegate.currentLocale.languageCode == 'ar'
                            ? const Radius.circular(50)
                            : const Radius.circular(0.0),
                        right: localizationDelegate.currentLocale.languageCode == 'ar'
                            ? const Radius.circular(0.0)
                            : const Radius.circular(50)),
                    color: AppColor.white),
                child: const RegisterScreen()),
          ),
        ],
      );
}
