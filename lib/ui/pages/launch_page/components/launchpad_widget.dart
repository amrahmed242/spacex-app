import 'package:flutter/material.dart';

import '../../../../core/models/launchpad.dart';
import '../../../../ui/widgets/app_card.dart';
import '../../../../ui/widgets/faded_widget.dart';
import '../../../../ui/widgets/name_value_widget.dart';
import '../../../../ui/widgets/space_logo.dart';

class LaunchpadWidget extends StatelessWidget {
  final bool launchpadLoaded;
  final bool loading;
  final Launchpad launchpad;
  const LaunchpadWidget({Key key, this.launchpadLoaded, this.loading, this.launchpad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.info_outline, color: Colors.white, size: 32),
          Text("LAUNCHPAD DETAILS", style: TextStyle(fontSize: 36)),
        ]),
        AppCard(
          width: double.infinity,
          widget: !launchpadLoaded
              ? FadedWidget(repeat: loading, widget: SizedBox(height: 80, child: SpaceLogo()))
              : FadedWidget(
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // color: AppColors.secondaryText
                      NameValueWidget(name: 'Name', value: launchpad.name),
                      NameValueWidget(name: 'Full Name', value: launchpad.fullName),
                      NameValueWidget(name: 'Locality', value: launchpad.locality),
                      NameValueWidget(name: 'Region', value: launchpad.region),
                      NameValueWidget(name: 'Launch Attempts', value: launchpad.launchAttempts.toString()),
                      NameValueWidget(name: 'Launch Successes', value: launchpad.launchAttempts.toString()),
                      NameValueWidget(name: 'Latitude', value: launchpad.latitude.toString()),
                      NameValueWidget(name: 'Longitude', value: launchpad.longitude.toString()),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}
