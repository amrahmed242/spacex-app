// provider_setup.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../core/services/rocket_launches/rocket_launches_serivce.dart';
import '../../core/services/rocket_launches/rocket_launches_service_impl.dart';
import '../services/api/http_client.dart';

List<SingleChildWidget> getProviders(BuildContext c) {
  List<SingleChildWidget> independentServices = [
    Provider<HttpClient>(create: (c) => HttpClient()),
  ];

  List<SingleChildWidget> dependentServices = [
    ProxyProvider<HttpClient, RocketLaunchesService>(update: (context, api, rocketLaunchService) => RocketLaunchesServiceImpl(api))
  ];

  List<SingleChildWidget> uiConsumableProviders = [];

  List<SingleChildWidget> providers = [
    ...independentServices,
    ...dependentServices,
    ...uiConsumableProviders,
  ];

  return providers;
}
