import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'custom_elevated_button.dart';

class RowOfButtons extends StatelessWidget {
  const RowOfButtons(
      {Key? key, required this.onPressedRegister, required this.onPressedLogin})
      : super(key: key);

  final void Function() onPressedRegister;
  final void Function() onPressedLogin;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomElevatedButton(
            onPressed: onPressedLogin,
            text: translate('login'),
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.30,
            textStyle: Theme.of(context).textTheme.headline6,
          ),
          CustomElevatedButton(
              onPressed: onPressedRegister,
              text: translate('register'),
              textStyle: Theme.of(context).textTheme.headline6,
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.30),
        ],
      ),
    );
  }
}
