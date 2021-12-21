import 'package:flutter/foundation.dart';

import '../../../core/models/launchpad.dart';
import '../../../core/models/payload.dart';
import '../../../core/models/rocket.dart';
import '../../../core/models/rocket_lauch.dart';

abstract class RocketLaunchesService {
  Future<RocketLaunch> getNextLaunche();
  Future<List<RocketLaunch>> getPastLaunches();
  Future<RocketLaunch> getLaunchById({@required String id});
  Future<Launchpad> getLaunchpadById({@required String id});
  Future<Payload> getPayloadById({@required String id});
  Future<Rocket> getRocketById({@required String id});
  Future<List<RocketLaunch>> getLaunchesBetweenDates({@required DateTime startDate, @required DateTime endDate});
}
