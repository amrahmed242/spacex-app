import 'package:flutter/material.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';

import '../../../../core/utils/ui.dart';

class LaunchCounter extends StatelessWidget {
  final Duration duration;
  final double fontSize;
  const LaunchCounter({Key key, this.duration, this.fontSize = 28}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('TIME REMAINING', style: TextStyle(fontSize: fontSize)),
        SlideCountdownClock(
          duration: duration,
          slideDirection: SlideDirection.Up,
          separator: ":",
          textStyle: TextStyle(fontSize: fontSize - 3, fontWeight: FontWeight.bold),
          shouldShowDays: true,
          onDone: () => UI.showInSnackBar(context, 'Launch started!'),
        ),
      ],
    );
  }
}
