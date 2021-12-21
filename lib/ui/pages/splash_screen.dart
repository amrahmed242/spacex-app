import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../core/utils/screen_utils.dart';
import '../../core/utils/ui.dart';
import '../../ui/pages/home_page/home_page.dart';
import '../../ui/widgets/faded_widget.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      navigate(context);
    });
  }

  navigate(context) async {
    await Future.delayed(Duration(milliseconds: 1500));
    UI.pushNamed(context, replace: true, route: HomePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
        child: Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // PageBackground(),
          Center(
            child: FadedWidget(
              durationMill: 1400,
              widget: Image.asset(
                "assets/images/spacex.png",
                width: MediaQuery.of(context).size.width / 1.5,
              ),
            ),
          ),
        ],
      ),
    ));
  }

  loadingWidget() => CircularProgressIndicator();
}
