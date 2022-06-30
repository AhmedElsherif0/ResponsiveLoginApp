import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final FToast fToast = FToast();
 showToast(String? text) {
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      //color: AppColors.lightGray,
    ),
    child: Text(text!,style:const TextStyle(fontSize: 18),),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.SNACKBAR,
    toastDuration: const Duration(seconds: 2),
  );



}