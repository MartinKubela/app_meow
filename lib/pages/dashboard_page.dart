import 'dart:math';

import 'package:app_meow/controls/dashboard_control.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final control = DashboardControl();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 30,
            left: -50,
            child: Transform.rotate(
              angle: pi / 2,
              child: Image.asset(
                'assets/images/cat.png',
                width: 200,
                height: 200,
              ),
            ),
          ),
          Positioned(
            top: 120,
            right: 120,
            child: Text(
              'Meow?',
              style: TextStyle(color: theme.primaryColor, fontSize: 30),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 70,
              ),
              const _DashboardButton()
            ],
          ),
        ],
      ),
    );
  }
}

class _DashboardButton extends StatelessWidget {
  const _DashboardButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      splashColor: theme.accentColor,
      highlightColor: theme.canvasColor,
      onTap: () {
        print('yo');
      },
      child: Container(
        width: 250,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: theme.primaryColor, width: 2),
        ),
        alignment: Alignment.center,
        child: Text('Explore kittens'),
      ),
    );
  }
}
