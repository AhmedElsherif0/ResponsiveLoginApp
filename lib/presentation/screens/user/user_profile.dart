import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/global_form.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/localization_button.dart';
import 'package:sizer/sizer.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const Spacer(),
                const LocalizationButton(),
                Expanded(
                    flex: 6,
                    child: Image.asset('assets/images/flutter_logo.png',
                        fit: BoxFit.none, height: 36.h, width: 44.w)),
                const Spacer()
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: GlobalForm(),
          ),
        ],
      ),
    );
  }
}
