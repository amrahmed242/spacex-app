import 'package:flutter/material.dart';

import '../../core/utils/screen_utils.dart';

class SpacexAppBar extends AppBar {
  SpacexAppBar({Key key})
      : super(
            title: Image.asset(
          'assets/images/spacex.png',
          width: ScreenUtil.screenWidthDp / 2,
        ));
}
