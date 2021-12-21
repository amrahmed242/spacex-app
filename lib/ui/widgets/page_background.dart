import 'package:flutter/material.dart';

import '../../core/utils/screen_utils.dart';

class PageBackground extends StatelessWidget {
  final double size;
  final String asset;
  const PageBackground({Key key, this.size, this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: .06,
      child: Center(
        child: Image.asset(
          'assets/images/${asset ?? 'spacemanround'}.png',
          fit: BoxFit.fitWidth,
          width: size ?? ScreenUtil.screenWidthDp,
          height: size ?? ScreenUtil.screenWidthDp,
        ),
      ),
    );
  }
}
