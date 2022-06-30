import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.backgroundColor = AppColor.blue,
     required this.textStyle ,
      required this.height,
      required this.width, this.alignment = Alignment.center})
      : super(key: key);

  final void Function() onPressed;
  final String text;
  Color backgroundColor;
  TextStyle? textStyle;
  final double height;
  final Alignment alignment;

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          child: Text(text,
              style: textStyle),
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              primary: backgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)))),
    );
  }
}
