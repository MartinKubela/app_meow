import 'package:app_meow/controls/dashboard_control.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final control = DashboardControl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Text("Dashboard"),
      ),
    );
  }
}
