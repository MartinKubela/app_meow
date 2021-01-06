import 'package:app_meow/controls/init_control.dart';
import 'package:app_meow/pages/dashboard_page.dart';
import 'package:flutter/material.dart';

class InitPage extends StatelessWidget {
  final control = InitControl();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => DashboardPage())));
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
