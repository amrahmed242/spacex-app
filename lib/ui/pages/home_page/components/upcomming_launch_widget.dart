import 'dart:math';

import 'package:flutter/material.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';

import '../../../../core/models/rocket_lauch.dart';
import '../../../../core/utils/date_helper.dart';
import '../../../../core/utils/screen_utils.dart';
import '../../../../core/utils/ui.dart';
import '../../../../ui/widgets/app_card.dart';
import '../../../../ui/widgets/launch_image_widget.dart';

class NextLaunchWidget extends StatelessWidget {
  final RocketLaunch nextLaunch;
  final Function onPress;
  const NextLaunchWidget({Key key, this.nextLaunch, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onPress: () => onPress(),
      widget: SizedBox(
        height: max(205, ScreenUtil.screenHeightDp / 5),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('UPCOMMING LAUNCH', style: TextStyle(fontSize: 18)),
                SlideCountdownClock(
                  duration: DateHelper().getDuration(nextLaunch.dateUnix),
                  slideDirection: SlideDirection.Up,
                  separator: ":",
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  shouldShowDays: true,
                  onDone: () => UI.showInSnackBar(context, 'Launch started!'),
                ),
                Text('Flight Name: ' + nextLaunch.name),
              ],
            ),
          ),
          Expanded(child: LaunchImage(id: nextLaunch.id, imageUrl: nextLaunch.links.patch.small))
        ]),
      ),
    );
  }
}
