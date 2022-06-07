import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({Key? key, required this.keyText, required this.valueText})
      : super(key: key);

  final String keyText;
  final String? valueText;

  @override
  Widget build(BuildContext context) {
    return Text('$keyText : $valueText',
        style: Theme.of(context).textTheme.headline5,textDirection: TextDirection.ltr,);
  }
}
