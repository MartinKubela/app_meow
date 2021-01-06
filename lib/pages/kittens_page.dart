import 'package:app_meow/controls/kittens_control.dart';
import 'package:flutter/material.dart';

class KittensPage extends StatelessWidget {
  final control = KittensControl();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Container();
        },
      ),
    );
  }
}
