import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../core/models/launchpad.dart';
import '../../core/models/payload.dart';
import '../../core/models/rocket.dart';
import '../../core/models/rocket_lauch.dart';
import '../../core/services/rocket_launches/rocket_launches_serivce.dart';
import '../../core/utils/base_notifier.dart';

class LaunchPageModel extends BaseNotifier {
  Rocket _rocket;
  Launchpad _launchpad;
  List<Payload> _payloads;
  final RocketLaunch _rocketLaunch;
  YoutubePlayerController _youtubeController;
  RocketLaunchesService _rocketLaunchesService;

  YoutubePlayerController get videoController => _youtubeController;
  Rocket get rocket => _rocket;
  Launchpad get launchpad => _launchpad;
  List<Payload> get payloads => _payloads;
  RocketLaunch get rocketLaunch => _rocketLaunch;

  LaunchPageModel(this._rocketLaunch, {BuildContext context}) : super(state: NotifierState.busy) {
    if (this._rocketLaunch.links.youtubeId != null) initializeController();
    _rocketLaunchesService = Provider.of(context);
  }

  @override
  void dispose() {
    super.dispose();
    _youtubeController?.dispose();
  }

  fetchData({BuildContext context}) async {
    setBusy();
    await Future.wait([
      fetchLaunchpad(context: context, id: rocketLaunch.launchpad),
      fetchRocket(context: context, id: rocketLaunch.rocket),
      fetchPayloads(context: context, ids: rocketLaunch.payloads),
    ]);
    setIdle();
  }

  Future fetchLaunchpad({BuildContext context, String id}) async {
    setBusy();
    try {
      _launchpad = await _rocketLaunchesService.getLaunchpadById(id: id);
    } catch (e) {
      setError();
    }
  }

  Future fetchRocket({BuildContext context, String id}) async {
    try {
      _rocket = await _rocketLaunchesService.getRocketById(id: id);
    } catch (e) {
      setError();
    }
  }

  Future fetchPayloads({BuildContext context, List<String> ids}) async {
    try {
      final res = await Future.wait<Payload>(ids.map((id) => _rocketLaunchesService.getPayloadById(id: id)));
      _payloads = res;
    } catch (e) {
      setError();
    }
  }

  onClose(BuildContext context) => Navigator.pop(context);

  initializeController() {
    _youtubeController = YoutubePlayerController(
      initialVideoId: rocketLaunch.links.youtubeId,
      flags: YoutubePlayerFlags(autoPlay: false),
    );
  }
}
