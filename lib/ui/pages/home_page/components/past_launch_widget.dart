import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/rocket_lauch.dart';
import '../../../../core/utils/date_helper.dart';
import '../../../../ui/styles/colors.dart';
import '../../../../ui/widgets/app_card.dart';
import '../../../../ui/widgets/launch_image_widget.dart';

class PastLaunchWidget extends StatelessWidget {
  final RocketLaunch rocketLaunch;
  final Function onPress;
  const PastLaunchWidget({Key key, this.rocketLaunch, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: AppCard(
        onPress: () => onPress(),
        widget: Container(
          height: 85,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: double.infinity, child: AutoSizeText(rocketLaunch.name, maxLines: 1, style: TextStyle(fontSize: 24))),
                  Text(
                    'Launched on: ' + DateHelper().getLaunchDate(rocketLaunch.dateUnix),
                    style: TextStyle(fontSize: 14, color: AppColors.secondaryText),
                  ),
                ],
              ),
            ),
            Expanded(child: LaunchImage(id: rocketLaunch.id, imageUrl: rocketLaunch.links.patch.small))
          ]),
        ),
      ),
    );
  }
}
