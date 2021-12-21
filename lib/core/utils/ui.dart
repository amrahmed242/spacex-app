import 'dart:async';

import 'package:flutter/material.dart';

class UI {
  static Future<dynamic> pushNamed(BuildContext context, {String route, Object args, bool replace = false}) async {
    return replace
        ? await Navigator.pushReplacementNamed(context, route, arguments: args)
        : await Navigator.pushNamed(context, route, arguments: args);
  }

  static showInSnackBar(BuildContext context, msg, {Color color = Colors.green}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: color,
        padding: EdgeInsets.all(8),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(msg, style: TextStyle(fontSize: 21, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
