import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../loading_widget.dart';

class NormalButton extends StatelessWidget {
  final bool busy;
  final bool bold;
  final double width;
  final double height;
  final double raduis;
  final double elevation;
  final String text;
  final Widget child;
  final IconData suffixIcon;
  final IconData perfixIcon;
  final Color color;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Function onPressed;
  final Color textColor;
  const NormalButton(
      {Key key,
      this.busy = false,
      this.child,
      this.onPressed,
      this.text = 'ok',
      this.width,
      this.height,
      this.elevation = 0,
      this.raduis = 12,
      this.margin = const EdgeInsets.symmetric(vertical: 5),
      this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      this.textColor = Colors.white,
      this.color = AppColors.secondaryColor,
      this.bold = true,
      this.suffixIcon,
      this.perfixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(raduis)),
        color: color,
        hoverElevation: 0,
        focusElevation: 0,
        elevation: elevation,
        highlightElevation: elevation,
        minWidth: width ?? double.infinity,
        onPressed: () => onPressed == null || busy ? {} : onPressed(),
        child: Padding(
          padding: padding,
          child: busy
              ? LoadingIndicator(size: 19)
              : child != null
                  ? child
                  : (suffixIcon != null || perfixIcon != null)
                      ? Row(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [
                          if (perfixIcon != null) Icon(perfixIcon, color: Colors.white, size: 15),
                          SizedBox(width: 6),
                          buildButtonText(),
                          SizedBox(width: 6),
                          if (suffixIcon != null) Icon(suffixIcon, color: Colors.white, size: 15),
                        ])
                      : buildButtonText(),
        ),
      ),
    );
  }

  AutoSizeText buildButtonText() {
    return AutoSizeText(
      text ?? '',
      maxFontSize: 14,
      minFontSize: 7,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: textColor,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
