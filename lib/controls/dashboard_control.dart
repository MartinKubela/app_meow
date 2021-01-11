import 'package:app_meow/pages/kittens_page.dart';
import 'package:flutter/material.dart';

class DashboardControl {
  void toKittens(context) =>
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => KittensPage()));

}
