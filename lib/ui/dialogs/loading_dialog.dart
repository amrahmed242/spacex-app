import 'package:flutter/material.dart';

import '../../ui/widgets/faded_widget.dart';
import '../../ui/widgets/space_logo.dart';

class LoadingDialog {
  static Future<T> show<T>(BuildContext context) async {
    return await showDialog(
      barrierColor: Colors.black.withOpacity(.75),
      context: context,
      barrierDismissible: false,
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: FadedWidget(
          repeat: true,
          widget: Center(child: SpaceLogo()),
        ),
      ),
    );
  }
}
