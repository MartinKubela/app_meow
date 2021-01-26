import 'package:app_meow/components/breedCard/breed_card.dart';
import 'package:app_meow/components/loading_indicator.dart';
import 'package:app_meow/components/page_layout.dart';
import 'package:app_meow/controls/breeds_control.dart';
import 'package:app_meow/entities/breed_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BreedsPage extends StatelessWidget {
  final control = BreedsControl();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () => control.onWillPop(context),
      child: Provider(
        create: (context) => control,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: theme.accentColor,
            body: PageLayout(
              title: 'Breeds',
              child: _BreedsBuilder(),
            ),
          ),
        ),
      ),
    );
  }
}

class _BreedsBuilder extends StatelessWidget {
  const _BreedsBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final control = Provider.of<BreedsControl>(context);
    return FutureBuilder(
      future: control.getBreeds(),
      builder: (BuildContext context, AsyncSnapshot<Iterable<Breed>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: snapshot.data
                  .map<Widget>(
                    (e) => BreedCard<BreedsControl>(e),
                  )
                  .toList(growable: false),
            ),
          );
        } else {
          return LoadingIndicator();
        }
      },
    );
  }
}

