import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/enum_global_authentication.dart';
import 'package:sizer/sizer.dart';

import '../styles/colors.dart';
import 'custom_elevated_button.dart';

class LocalizationButton extends StatelessWidget {
  const LocalizationButton({Key? key}) : super(key: key);


  /// i didn't work on this feature yet because i haven't worked on this before
  /// but after pushing my branch to github i will learn it immediately.


  GlobalCubit _globalCubit(context) => BlocProvider.of(context);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalStates>(
      builder: (context, state) {
        return Row(
          children: [
            const Spacer(),
            if(_globalCubit(context).changePage == GlobalAuth.login)
            CustomElevatedButton(
              text: 'عريى',
              backgroundColor: AppColor.white,
              textStyle: Theme
                  .of(context)
                  .textTheme
                  .bodyText2,
              height: 4.h,
              width: 20.w,
              onPressed: () {

              },
            ),
            const Spacer(flex: 10)
          ],
        );
      },
    );
  }
}
