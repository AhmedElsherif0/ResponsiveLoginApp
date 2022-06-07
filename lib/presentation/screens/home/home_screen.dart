import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/constants_values.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
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
        title: Text(
          'User Data',
          style: Theme.of(context).textTheme.headline4,
        ),
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
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomText(
                              keyText: 'Name',
                              valueText: accountModel[0].name ?? 'Ahmed'),
                          CustomText(
                              keyText: 'Email',
                              valueText:
                                  accountModel[0].email ?? 'ahmed@gmail.com'),
                          CustomText(
                              keyText: 'Phone',
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
            CustomElevatedButton(
                width: 40.w,
                height: 8.h,
                text: 'Logout',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, splashScreen);
                },
                backgroundColor: AppColor.red,
                textStyle: Theme.of(context).textTheme.headline6),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
