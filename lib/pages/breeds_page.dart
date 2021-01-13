import 'package:app_meow/components/loading_indicator.dart';
import 'package:app_meow/controls/breeds_control.dart';
import 'package:app_meow/entities/breed_entity.dart';
import 'package:app_meow/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BreedsPage extends StatelessWidget {
  final control = BreedsControl();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () => control.onWillPop(context),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: theme.backgroundColor,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, top: 30),
                    child: Text(
                      'Breeds:',
                      style: theme.textTheme.subtitle2,
                    ),
                  ),
                ),
                FutureBuilder(
                  future: control.getBreeds(),
                  builder: (BuildContext context,
                      AsyncSnapshot<Iterable<Breed>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: snapshot.data
                              .map<Widget>((e) => Text(e.name))
                              .toList(growable: false),
                        ),
                      );
                    } else {
                      return LoadingIndicator();
                    }
                  },
                ),
                SizedBox(
                  height: CatTheme.paddingHead,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
