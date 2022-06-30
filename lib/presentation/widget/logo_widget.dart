import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Center(
        child: Image.asset('assets/images/flutter_logo.png',
            fit: BoxFit.none, width: 44.w),
      ),
    );
  }
}
