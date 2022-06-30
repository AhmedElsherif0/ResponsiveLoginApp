import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

mixin ShowToastMixin {
   void showToastFromMixin(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: AppColor.blue)),
        duration: const Duration(seconds: 2),
        backgroundColor: AppColor.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(20), right: Radius.circular(20))),
        elevation: 5,
      ),
    );
  }
}
