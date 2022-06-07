import 'package:flutter/services.dart';

class OrientationSystem {
  Future lockOrientation() {
   return SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  Future hideStatusBar() {
    return SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  Future showStatusBar() {
    return SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }
}
