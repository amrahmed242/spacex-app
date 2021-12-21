import 'package:flutter/cupertino.dart';

import '../../../core/models/launch_query.dart';
import '../../../core/models/launchpad.dart';
import '../../../core/models/payload.dart';
import '../../../core/models/rocket.dart';
import '../../../core/models/rocket_lauch.dart';
import '../../../core/services/api/http_client.dart';
import '../../../core/services/rocket_launches/rocket_launches_serivce.dart';

class EndPoint {
  static const String LAUNCH = 'v5/launches';
  static const String LAUNCHEPAD = 'v4/launchpads';
  static const String PAYLOAD = 'v4/payloads';
  static const String ROCKET = 'v4/rockets';
  static const String SEARCH = 'v5/launches/query';
  static const String NEXTLAUNCH = 'v5/launches/next';
  static const String PASTLAUNCHES = 'v5/launches/past';
}

class RocketLaunchesServiceImpl extends RocketLaunchesService {
  final HttpClient api;

  RocketLaunchesServiceImpl(this.api);

  @override
  Future<RocketLaunch> getNextLaunche() async {
    try {
      final res = await api.request(EndPoint.NEXTLAUNCH);
      return res?.statusCode == 200 ? RocketLaunch.fromJson(res.data) : null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<RocketLaunch>> getPastLaunches() async {
    try {
      final res = await api.request(EndPoint.PASTLAUNCHES);
      return res?.statusCode == 200 ? RocketLaunch.fromListJson(res.data) : null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<RocketLaunch>> getLaunchesBetweenDates({DateTime startDate, DateTime endDate}) async {
    try {
      final query = LaunchQuery(startDate: startDate, endDate: endDate);
      final res = await api.request(EndPoint.SEARCH, type: RequestType.Post, body: query.toJson());
      return res?.statusCode == 200 ? RocketLaunch.fromListJson(res.data['docs']) : null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<RocketLaunch> getLaunchById({@required String id}) async {
    try {
      final res = await api.request(EndPoint.LAUNCH + "/$id");
      return res?.statusCode == 200 ? RocketLaunch.fromJson(res.data) : null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Launchpad> getLaunchpadById({String id}) async {
    try {
      final res = await api.request(EndPoint.LAUNCHEPAD + "/$id");
      return res?.statusCode == 200 ? Launchpad.fromJson(res.data) : null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<Payload> getPayloadById({String id}) async {
    try {
      final res = await api.request(EndPoint.PAYLOAD + "/$id");
      return res?.statusCode == 200 ? Payload.fromJson(res.data) : null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<Rocket> getRocketById({String id}) async {
    try {
      final res = await api.request(EndPoint.ROCKET + "/$id");
      return res?.statusCode == 200 ? Rocket.fromJson(res.data) : null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
