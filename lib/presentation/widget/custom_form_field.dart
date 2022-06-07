import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField(
      {required this.hintText,
      required this.textInputType,
      this.prefixIcon,
      this.obscureText,
      this.validator,
      this.onSaved,
      this.controller,
      Key? key})
      : super(key: key);

  final String? hintText;
  final TextInputType? textInputType;
  Widget? prefixIcon;
  final bool? obscureText;
  final FormFieldValidator? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.2.h),
      child: TextFormField(
          validator: validator,
          maxLines: 1,
          keyboardType: textInputType,
          controller: controller,
          onSaved: onSaved,
          textAlign: TextAlign.start,
          textDirection: TextDirection.ltr,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: AppColor.lightGrey,
            hintText: hintText,
            hintStyle: const TextStyle(color: AppColor.textColorGrey),
            prefixIcon: prefixIcon,
            prefixIconColor: AppColor.textColorGrey,
            hintTextDirection: TextDirection.ltr,
            contentPadding: EdgeInsets.symmetric(
                horizontal: prefixIcon == null ? 12 : 6, vertical: 20),
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
      borderSide: const BorderSide(color: AppColor.darkGrey,width: 1.5),
    );
  }
}
