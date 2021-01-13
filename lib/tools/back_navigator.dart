import 'package:app_meow/pages/dashboard_page.dart';
import 'package:flutter/material.dart';

mixin BackNavigator {
  Future<bool> onWillPop(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => DashboardPage()));
    return Future.value(false);
  }
}
