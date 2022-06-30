import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../main.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {required this.hintText,
      required this.textInputType,
      this.prefixIcon,
      this.obscureText,
      this.validator,
      this.onSaved,
      this.controller,
      this.suffixIcon,
      Key? key})
      : super(key: key);

  final String? hintText;
  final TextInputType? textInputType;
  final Widget? prefixIcon;
  final bool? obscureText;
  final FormFieldValidator? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      margin: EdgeInsets.only(bottom: 0.4.h),
      child: TextFormField(
        validator: validator,
        maxLines: 1,
        keyboardType: textInputType,
        controller: controller,
        onSaved: onSaved,
        textAlign: localizationDelegate.currentLocale.countryCode == 'ar'
            ? TextAlign.end
            : TextAlign.start,
        textDirection: localizationDelegate.currentLocale.languageCode == 'ar'
            ? TextDirection.rtl
            : TextDirection.ltr,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: AppColor.lightGrey,
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColor.textColorGrey),
          prefixIcon:null,
          suffixIcon: suffixIcon,
          prefixIconColor: AppColor.textColorGrey,
          hintTextDirection:
              localizationDelegate.currentLocale.languageCode == 'ar'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          enabledBorder: _outlineInputBorder(),
          focusedBorder: _outlineInputBorder(),
          focusedErrorBorder: _outlineInputBorder(),
          errorBorder: _outlineInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColor.darkGrey, width: 1.5),
    );
  }
}
