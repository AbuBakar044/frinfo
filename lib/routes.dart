import 'package:flutter/material.dart';

void goNextScreen(BuildContext context, Widget screenName) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screenName));
}

void removeAndGoNextScreen(BuildContext context, Widget screenName) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => screenName));
}

void removeRoute(BuildContext context) {
  Navigator.pop(context);
}
