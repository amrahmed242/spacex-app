import 'package:flutter/material.dart';

import '../../ui/styles/styles.dart';

class NameValueWidget extends StatelessWidget {
  final String name, value;
  final TextStyle nameStyle, valueStyle;
  const NameValueWidget({Key key, this.name, this.value, this.nameStyle, this.valueStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(text: name + ': ', style: nameStyle),
          TextSpan(text: value, style: valueStyle ?? TextStyle(color: AppColors.secondaryText)),
        ],
      ),
    );
  }
}
