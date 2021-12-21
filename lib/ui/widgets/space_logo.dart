import 'package:flutter/material.dart';

import '../../core/utils/screen_utils.dart';

class SpaceLogo extends StatelessWidget {
  final double size;
  const SpaceLogo({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/spaceman.png',
      fit: BoxFit.fitWidth,
      width: size ?? ScreenUtil.screenWidthDp / 4,
    );
  }
}
