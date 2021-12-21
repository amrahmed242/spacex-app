import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/models/rocket.dart';
import '../../../../ui/widgets/app_card.dart';
import '../../../../ui/widgets/faded_widget.dart';
import '../../../../ui/widgets/name_value_widget.dart';
import '../../../../ui/widgets/space_logo.dart';

class RocketWidget extends StatelessWidget {
  final bool rocketLoaded;
  final bool loading;
  final Rocket rocket;
  const RocketWidget({Key key, this.rocketLoaded, this.loading, this.rocket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.rocket, color: Colors.white, size: 30),
            SizedBox(width: 5),
            Text("ROCKET DETAILS", style: TextStyle(fontSize: 36)),
          ],
        ),
        AppCard(
          width: double.infinity,
          widget: !rocketLoaded
              ? FadedWidget(repeat: loading, widget: SizedBox(height: 80, child: SpaceLogo()))
              : FadedWidget(
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // color: AppColors.secondaryText
                      NameValueWidget(name: 'Name', value: rocket.name),
                      NameValueWidget(name: 'Active', value: rocket.active.toString()),
                      NameValueWidget(name: 'Company', value: rocket.company),
                      NameValueWidget(name: 'Country', value: rocket.country),
                      NameValueWidget(name: 'Cost Per Launch', value: rocket.costPerLaunch.toString() + '\$'),
                      NameValueWidget(name: 'Description', value: rocket.description),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}
