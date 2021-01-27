import 'package:app_meow/components/breedCard/breed_card.dart';
import 'package:app_meow/components/inputs/cat_input.dart';
import 'package:app_meow/components/loading_indicator.dart';
import 'package:app_meow/components/page_layout.dart';
import 'package:app_meow/controls/breeds_control.dart';
import 'package:app_meow/entities/breed_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///Breeds page layout
class BreedsPage extends StatelessWidget {
  final listState = GlobalKey<BreedsListState>();

  @override
  Widget build(BuildContext context) {
    final control = BreedsControl(listState);
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () => control.onWillPop(context),
      child: MultiProvider(
        providers: [
          Provider(
            create: (context) => control,
          ),
          Provider(
            create: (context) => listState,
          ),
        ],
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

/// Widget for separation larger UI
class _BreedsBuilder extends StatelessWidget {
  const _BreedsBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final control = Provider.of<BreedsControl>(context);
    final listKey = Provider.of<GlobalKey<BreedsListState>>(context);
    return Column(
      children: [
        CatInput(control.filterInput),

        /// After data from [getBreeds] is got, create breeds list
        FutureBuilder(
          future: control.getBreeds(),
          builder:
              (BuildContext context, AsyncSnapshot<Iterable<Breed>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: _BreedsList(key: listKey),
              );
            } else {
              return LoadingIndicator();
            }
          },
        )
      ],
    );
  }
}

/// Widget that simply builds list of data
class _BreedsList extends StatefulWidget {
  @override
  BreedsListState createState() => BreedsListState();

  _BreedsList({Key key}) : super(key: key);
}

class BreedsListState extends State<_BreedsList> {
  @override
  Widget build(BuildContext context) {
    final control = Provider.of<BreedsControl>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: control.breeds
          .map<Widget>(
            (e) => BreedCard<BreedsControl>(e),
          )
          .toList(growable: false),
    );
  }
}
