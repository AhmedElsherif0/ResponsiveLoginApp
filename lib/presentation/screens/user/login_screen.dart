import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/login_form_fields.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/logo_widget.dart';
import 'package:sizer/sizer.dart';
import '../../../main.dart';
import '../../styles/colors.dart';
import '../../widget/custom_elevated_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  GlobalCubit _globalCubit(context) => BlocProvider.of<GlobalCubit>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth >= 576 && constraints.maxWidth <= 992) {
            return tabletLoginScreen();
          }
          if (constraints.maxWidth > 992) {
            return desktopLoginScreen();
          }
          return mobileLoginScreen();
        },
      ),
    );
  }

  Widget tabletLoginScreen() => BlocBuilder<GlobalCubit, GlobalStates>(
        builder: (context, state) => Row(
          children: [
            Expanded(
              flex: 2,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                          left:
                              localizationDelegate.currentLocale.languageCode ==
                                      'ar'
                                  ? const Radius.circular(50)
                                  : const Radius.circular(0.0),
                          right:
                              localizationDelegate.currentLocale.languageCode ==
                                      'ar'
                                  ? const Radius.circular(0.0)
                                  : const Radius.circular(50)),
                      color: AppColor.white),
                  child: const LoginFormFields()),
            ),
            Expanded(
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    children: [
                      const Spacer(flex: 10),
                      localizationButton(context),
                      const Spacer()
                    ],
                  ),
                  const LogoWidget(),
                  const Spacer()
                ],
              ),
            ),
          ],
        ),
      );

  Widget desktopLoginScreen() => BlocBuilder<GlobalCubit, GlobalStates>(
        builder: (context, state) => Row(
          children: [
            Expanded(
              flex: 3,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                          left:
                              localizationDelegate.currentLocale.languageCode ==
                                      'ar'
                                  ? const Radius.circular(50)
                                  : const Radius.circular(0.0),
                          right:
                              localizationDelegate.currentLocale.languageCode ==
                                      'ar'
                                  ? const Radius.circular(0.0)
                                  : const Radius.circular(50)),
                      color: AppColor.white),
                  child: const LoginFormFields()),
            ),
            Expanded(
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    children: [
                      const Spacer(flex: 10),
                      localizationButton(context),
                      const Spacer()
                    ],
                  ),
                  const LogoWidget(),
                  const Spacer()
                ],
              ),
            ),
          ],
        ),
      );

  Widget mobileLoginScreen() => Column(
        children: [
          Expanded(
            child: BlocBuilder<GlobalCubit, GlobalStates>(
              builder: (context, state) {
                return Column(
                  children: [
                    const Spacer(),
                    Row(
                      children: [
                        const Spacer(flex: 10),
                        localizationButton(context),
                        const Spacer()
                      ],
                    ),
                    const LogoWidget(),
                    const Spacer()
                  ],
                );
              },
            ),
          ),
          const Expanded(
            flex: 2,
            child: DecoratedBox(
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50))),
                child: LoginFormFields()),
          ),
        ],
      );

  Widget localizationButton( context,){
    return  CustomElevatedButton(
      text: translate('changeLanguage'),
      backgroundColor: AppColor.white,
      textStyle: Theme.of(context).textTheme.bodyText2,
      height: 5.h,
      width: 20.w,
      onPressed: () =>
          _globalCubit(context).localizationChange(context),
    );
  }
}

