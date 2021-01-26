import 'dart:math';

import 'package:app_meow/controls/dashboard_control.dart';
import 'package:app_meow/tools/enums.dart';
import 'package:app_meow/tools/parser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  final control = DashboardControl();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Provider(
      create: (context) => control,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                top: 30,
                right: -50,
                child: Transform.rotate(
                  angle: (3 / 2) * pi,
                  child: Image.asset(
                    'assets/images/cat.png',
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
              Positioned(
                top: 100,
                left: 50,
                child: Text(
                  'Meow?',
                  style: theme.textTheme.headline2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: MenuType.values
                      .map<Widget>((type) => _DashboardButton(type))
                      .toList(growable: false),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DashboardButton extends StatelessWidget {
  final MenuType type;

  const _DashboardButton(this.type, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final control = Provider.of<DashboardControl>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(bottom: 25, left: 20, right: 20),
      child: InkWell(
        splashColor: theme.accentColor,
        highlightColor: theme.canvasColor,
        onTap: () => control.resolvePage(context, type),
        child: Container(
          width: 250,
          height: 50,
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Icon(
                Icons.circle,
                color: theme.primaryColor,
                size: 10,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                'Explore ${CatParser.enumValueToString(type)}',
                style: theme.textTheme.bodyText2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
