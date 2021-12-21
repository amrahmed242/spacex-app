import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/models/rocket_lauch.dart';
import '../../core/models/search_interval.dart';
import '../../core/services/rocket_launches/rocket_launches_serivce.dart';
import '../../core/utils/base_notifier.dart';
import '../../core/utils/ui.dart';
import '../../ui/dialogs/loading_dialog.dart';
import '../../ui/pages/launch_page/launch_page.dart';

class HomePageModel extends BaseNotifier {
  RocketLaunch _nextLaunch;
  List<RocketLaunch> _pastLaunches;
  List<RocketLaunch> _launchesBetweenTwoDates;

  SearchInterval _searchInterval;
  RocketLaunchesService _rocketLaunchesService;

  HomePageModel(BuildContext context) {
    _rocketLaunchesService = Provider.of(context);
  }

  RocketLaunch get nextLaunch => _nextLaunch;
  List<RocketLaunch> get pastLaunches => _pastLaunches;
  List<RocketLaunch> get launchesBetweenDates => _launchesBetweenTwoDates;
  SearchInterval get searchInterval => _searchInterval;

  fetchLaunchData(BuildContext context) async {
    setBusy();
    LoadingDialog.show(context);
    try {
      final res = await Future.wait([
        _rocketLaunchesService.getNextLaunche(),
        _rocketLaunchesService.getPastLaunches()
      ]);
      _nextLaunch = res[0] as RocketLaunch;
      _pastLaunches = res[1] as List<RocketLaunch>;
      setIdle();
    } catch (e) {
      setError();
    }
    Navigator.pop(context);
  }

  openLaunchDetails({RocketLaunch rocketLaunch, BuildContext context}) {
    UI.pushNamed(context, route: LaunchPage.routeName, args: rocketLaunch);
  }

  onClearSearch(BuildContext context) {
    _launchesBetweenTwoDates = null;
    _searchInterval = null;
    setIdle();
  }

  onSearch(BuildContext context) async {
    final List<DateTime> picked = await openDatePicker(context);
    try {
      if (picked != null && picked.length == 2) {
        LoadingDialog.show(context);

        _searchInterval = SearchInterval(from: picked[0], to: picked[1]);
        setIdle();

        _launchesBetweenTwoDates =
            await _rocketLaunchesService.getLaunchesBetweenDates(
                startDate: searchInterval.from, endDate: searchInterval.to);

        Navigator.pop(context);
        setIdle();
      }
    } catch (e) {
      print(e);
      UI.showInSnackBar(context, 'Error Occured please try again',
          color: Colors.red);
      onClearSearch(context);
      Navigator.pop(context);
    }
  }

  Future<List<DateTime>> openDatePicker(BuildContext context) async {
    return await DateRangePicker.showDatePicker(
      context: context,
      initialFirstDate: new DateTime.now(),
      initialLastDate: (new DateTime.now()).add(new Duration(days: 6)),
      firstDate: new DateTime(2000),
      lastDate: new DateTime(DateTime.now().year + 500),
    );
  }
}
