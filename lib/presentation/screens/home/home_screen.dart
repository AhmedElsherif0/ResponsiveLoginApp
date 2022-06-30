import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/constants_values.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/main.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text.dart';
import 'package:sizer/sizer.dart';
import '../../styles/colors.dart';
import '../../widget/custom_elevated_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.accountModel}) : super(key: key);

  final List<AccountModel> accountModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(translate('userData'),
            style: Theme.of(context).textTheme.headline4),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 5,
                  child: Wrap(
                    children: [
                      Column(
                        crossAxisAlignment:
                            localizationDelegate.currentLocale.languageCode == 'en'
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomText(
                              keyText: translate('name'),
                              valueText: accountModel[0].name ?? 'Ahmed'),
                          CustomText(
                              keyText: translate('email'),
                              valueText:
                                  accountModel[0].email ?? 'ahmed@gmail.com'),
                          CustomText(
                              keyText: translate('phone'),
                              valueText:
                                  accountModel[0].phone ?? '01152226320'),
                        ],
                      )
                    ],
                  ),
                ),
                const Spacer()
              ],
            ),
            const Spacer(flex: 3),
            BlocBuilder<GlobalCubit, GlobalStates>(
              builder: (context, state) {
                return CustomElevatedButton(
                    width: 40.w,
                    height: 8.h,
                    text: translate('logout'),
                    onPressed: () {
                      BlocProvider.of<GlobalCubit>(context).clearUserData();
                      Navigator.pushReplacementNamed(
                          context, Constants.loginUserScreen);
                    },
                    backgroundColor: AppColor.red,
                    textStyle: Theme.of(context).textTheme.headline6);
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
