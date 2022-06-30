import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants_values.dart';
import '../../styles/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () =>
            Navigator.pushReplacementNamed(context, Constants.loginUserScreen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
        children: [
          const Spacer(),
          Expanded(
            child: Center(
                child: ClipRRect(
                  clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset('assets/images/logo.png', width: 50.w))),
          ),
          const Spacer(flex: 2)
        ],
      ),
    );
  }
}
