import 'package:flutter/material.dart';

import '../../main.dart';

class CustomText extends StatelessWidget {
  const CustomText({Key? key, required this.keyText, required this.valueText})
      : super(key: key);

  final String keyText;
  final String valueText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: localizationDelegate.currentLocale.languageCode == 'en'
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: [
        Text(
          localizationDelegate.currentLocale.languageCode == 'en' ? keyText : valueText,
          style: Theme.of(context).textTheme.headline5,
          textDirection: TextDirection.ltr,
        ),
        Text(
          ' : ',
          style: Theme.of(context).textTheme.headline5,
          textDirection: TextDirection.ltr,
        ),
        Text(
          localizationDelegate.currentLocale.languageCode == 'en' ? valueText : keyText,
          style: Theme.of(context).textTheme.headline5,
          textDirection: TextDirection.ltr,
        )
      ],
    );
  }
}
