import 'package:flutter/material.dart';

class NavigateUtil {
  static Future<dynamic> navigate(BuildContext context, Widget screen,
      [bool clearStack = false]) {
    if (clearStack) {
      return Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => screen),
              (Route<dynamic> route) => false);

    } else {
      return Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => screen,
          ));

    }
  }

  static void pop(BuildContext context, [dynamic data]) {
    Navigator.pop(context, data);
  }
}
