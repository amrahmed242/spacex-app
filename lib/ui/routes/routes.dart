import 'package:flutter/cupertino.dart';

import '../../../../../ui/pages/splash_screen.dart';
import '../../ui/pages/home_page/home_page.dart';
import '../../ui/pages/launch_page/launch_page.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    return {
      SplashScreen.routeName: (context) => SplashScreen(),
      HomePage.routeName: (context) => HomePage(),
      LaunchPage.routeName: (context) => LaunchPage(rocketLaunch: ModalRoute.of(context).settings.arguments),
    };
  }
}
