import 'package:flutter/material.dart';

import '../../ui/styles/colors.dart';

class AppCard extends StatelessWidget {
  final Widget widget;
  final Function onPress;
  final Color color;
  final double height;
  final double width;
  const AppCard({Key key, this.widget, this.onPress, this.color = AppColors.secondaryColor, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => onPress != null ? onPress() : {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: SizedBox(height: height, width: width, child: widget),
        ),
      ),
    );
  }
}
