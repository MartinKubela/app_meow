import 'package:app_meow/components/loading_indicator.dart';
import 'package:app_meow/controls/init_control.dart';
import 'package:flutter/material.dart';

class InitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final control = InitControl(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FutureBuilder(
          future: control.init(),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) =>
              LoadingIndicator(),
        ),
      ),
    );
  }
}
