import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final String text;
  final double size;
  const LoadingIndicator({Key key, this.text, this.size = 40}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            if (text != null)
              Text(
                text,
                style: TextStyle(fontSize: 11, color: Colors.grey),
                maxLines: 1,
              ),
          ],
        ));
  }
}
