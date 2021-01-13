import 'package:app_meow/controls/kittens_control.dart';
import 'package:app_meow/entities/cat_entity.dart';
import 'package:app_meow/theme.dart';
import 'package:flutter/cupertino.dart';
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
                      'Kittens:',
                      style: theme.textTheme.subtitle2,
                    ),
                  ),
                ),
                FutureBuilder(
                  future: control.getKittens(),
                  builder: (BuildContext context,
                      AsyncSnapshot<Iterable<Cat>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: snapshot.data
                              .map<Widget>((e) => _CatCard(e))
                              .toList(growable: false),
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
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

class _CatCard extends StatelessWidget {
  final Cat cat;

  _CatCard(this.cat) : super(key: ValueKey(cat.id));

  @override
  Widget build(BuildContext context) {
    final theme = (Theme.of(context));
    return Padding(
      padding: EdgeInsets.only(top: CatTheme.paddingHead),
      child: Stack(
        overflow: Overflow.visible,alignment: Alignment.topCenter,
        children: [
          Container(
            width: 300,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: theme.accentColor.withOpacity(0.5)),
            alignment: Alignment.center,
            child: Text(cat.id),
          ),
          Positioned(
            top: -50,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                cat.imagePath,
                width: 220,
                height: 90,fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
