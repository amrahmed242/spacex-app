import 'package:flutter/material.dart';

import '../../ui/styles/colors.dart';

class CustomProgressIndicator extends StatelessWidget {
  final int progress;
  final double height;
  const CustomProgressIndicator({Key key, this.height = 4, this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paddingFactor = progress > 0 ? ((100 - progress) / 100) : 1;
    return Container(
      height: height,
      decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(35)),
      margin: EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: double.infinity,
            height: height,
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(35),
            ),
            margin: EdgeInsetsDirectional.only(end: constraints.maxWidth * paddingFactor),
          );
        },
      ),
    );
  }
}
