import 'package:flutter/material.dart';

import '../../../../ui/styles/colors.dart';

class LaunchDate extends StatelessWidget {
  final String date;
  final double fontSize;
  const LaunchDate({Key key, @required this.date, this.fontSize = 28}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('LAUNCH DATE', style: TextStyle(fontSize: fontSize)),
        Text(date, style: TextStyle(fontSize: fontSize - 8, color: AppColors.primaryText))
      ],
    );
  }
}
