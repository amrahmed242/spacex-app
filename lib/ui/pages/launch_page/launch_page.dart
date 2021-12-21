import 'package:flutter/material.dart';

import '../../../core/models/rocket_lauch.dart';
import '../../../core/page_models/launch_page_model.dart';
import '../../../core/utils/date_helper.dart';
import '../../../ui/pages/launch_page/components/launch_counter.dart';
import '../../../ui/pages/launch_page/components/launch_sate.dart';
import '../../../ui/pages/launch_page/components/launchpad_widget.dart';
import '../../../ui/pages/launch_page/components/payload_widget.dart';
import '../../../ui/pages/launch_page/components/rocket_widget.dart';
import '../../../ui/pages/launch_page/components/youtube_widget.dart';
import '../../../ui/widgets/base_widget.dart';
import '../../../ui/widgets/faded_widget.dart';
import '../../../ui/widgets/launch_image_widget.dart';
import '../../../ui/widgets/page_background.dart';
import '../../../ui/widgets/spacex_appbar_widget.dart';

class LaunchPage extends StatelessWidget {
  static const routeName = '/launchPage';
  final RocketLaunch rocketLaunch;

  const LaunchPage({Key key, @required this.rocketLaunch}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SpacexAppBar(),
      body: BaseWidget<LaunchPageModel>(
          initState: (m) => WidgetsBinding.instance.addPostFrameCallback((_) => m.fetchData(context: context)),
          model: LaunchPageModel(rocketLaunch, context: context),
          builder: (context, model, child) {
            final _launchpadLoaded = model.launchpad != null;
            final _payloadLoaded = model.payloads != null;
            final _rocketLoaded = model.rocket != null;
            return SafeArea(
              child: FadedWidget(
                widget: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.topCenter,
                    children: [
                      PageBackground(),
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            //Launch Image Widget
                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: LaunchImage(
                                id: rocketLaunch.id,
                                imageUrl: rocketLaunch.links.patch.small,
                                size: 150,
                              ),
                            ),

                            //Launch Time Widget
                            rocketLaunch.upcoming
                                ? LaunchCounter(duration: DateHelper().getDuration(rocketLaunch.dateUnix))
                                : LaunchDate(date: DateHelper().getLaunchDate(rocketLaunch.dateUnix)),
                            Text('Flight Name: ' + rocketLaunch.name, style: TextStyle(fontSize: 18)),

                            //Youtube Widget
                            if (rocketLaunch.links.youtubeId != null)
                              YoutubeWidget(videoId: rocketLaunch.links.youtubeId, controller: model.videoController),

                            //Rocket Widget
                            RocketWidget(loading: model.busy, rocket: model.rocket, rocketLoaded: _rocketLoaded),

                            //Launchpad Widget
                            LaunchpadWidget(launchpadLoaded: _launchpadLoaded, loading: model.busy, launchpad: model.launchpad),

                            //Payload Widget
                            PayloadWidget(loading: model.busy, payloadLoaded: _payloadLoaded, payloads: model.payloads),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
