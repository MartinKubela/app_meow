import 'package:app_meow/controls/kittens_control.dart';
import 'package:app_meow/entities/cat_entity.dart';
import 'package:flutter/material.dart';

class KittensPage extends StatelessWidget {

  final control = KittensControl();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () => control.onWillPop(context),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: theme.backgroundColor,
          body: FutureBuilder(future: control.getKittens(),
            builder: (BuildContext context, AsyncSnapshot<Iterable<Cat>> snapshot) {

              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  children: snapshot.data.map<Widget>((e) => Text(e.id)).toList(
                      growable: false
                  ),
                );
              }
              else {
                return const Center(child: CircularProgressIndicator(),);
              }
            },
          ),
        ),
      ),
    );
  }
}
