import 'package:flutter/material.dart';

import '../../../../core/page_models/home_page_model.dart';
import '../../../../ui/pages/home_page/components/filter_launches_widget.dart';
import '../../../../ui/pages/home_page/components/past_launch_widget.dart';
import '../../../../ui/pages/home_page/components/upcomming_launch_widget.dart';
import '../../../../ui/widgets/base_widget.dart';
import '../../../../ui/widgets/faded_widget.dart';
import '../../../../ui/widgets/page_background.dart';
import '../../../../ui/widgets/spacex_appbar_widget.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/homePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SpacexAppBar(),
      body: BaseWidget<HomePageModel>(
          initState: (m) => WidgetsBinding.instance.addPostFrameCallback((_) => m.fetchLaunchData(context)),
          model: HomePageModel(context),
          builder: (context, model, child) {
            if (!model.busy && model.nextLaunch != null) {
              final filtered = model.launchesBetweenDates != null && model.searchInterval != null;

              return FadedWidget(
                  widget: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.topCenter,
                    children: [
                      PageBackground(),
                      CustomScrollView(
                        physics: BouncingScrollPhysics(),
                        slivers: [
                          SliverList(
                            delegate: SliverChildListDelegate(
                              [
                                NextLaunchWidget(
                                  nextLaunch: model.nextLaunch,
                                  onPress: () => model.openLaunchDetails(rocketLaunch: model.nextLaunch, context: context),
                                ),
                              ],
                            ),
                          ),
                          SliverList(
                            delegate: SliverChildListDelegate(
                              [
                                FilterLaunchesWidget(
                                  onClearSearch: () => model.onClearSearch(context),
                                  onSearch: () => model.onSearch(context),
                                  searchInterval: model.searchInterval,
                                )
                              ],
                            ),
                          ),
                          SliverList(
                            delegate: SliverChildBuilderDelegate((c, i) {
                              return PastLaunchWidget(
                                  onPress: () => model.openLaunchDetails(
                                      rocketLaunch: filtered ? model.launchesBetweenDates[i] : model.pastLaunches[i], context: context),
                                  rocketLaunch: filtered ? model.launchesBetweenDates[i] : model.pastLaunches[i]);
                            }, childCount: filtered ? model.launchesBetweenDates.length : model.pastLaunches.length),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ));
            } else {
              return PageBackground();
            }
          }),
    );
  }
}
