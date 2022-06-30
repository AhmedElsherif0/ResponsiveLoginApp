
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../screens/home/home_screen.dart';


mixin DelayNavigator{

  void delayedNavigator(context, authModel) {
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      Future.delayed(Duration.zero, () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(
            builder: (BuildContext context) =>
                HomeScreen(accountModel: authModel),
          ),
        );
      });
    });
  }

}