import 'package:app_meow/components/breedCard/breed_card.dart';
import 'package:app_meow/components/loading_indicator.dart';
import 'package:app_meow/components/page_layout.dart';
import 'package:app_meow/controls/favs_control.dart';
import 'package:app_meow/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Favourite page layout
class FavsPage extends StatefulWidget {
  @override
  _FavsPageState createState() => _FavsPageState();
}

///State of page
///
/// state is needed for reRender of page when breed is removed from favs
/// its need to rebuild list with new values
class _FavsPageState extends State<FavsPage> {
  void _refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final control = FavsControl(_refresh);
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () => control.onWillPop(context),
      child: Provider(
        create: (context) => control,
        child: SafeArea(
          child: Scaffold(
              backgroundColor: theme.accentColor,
              body:
                  PageLayout(title: 'Favourite breeds', child: _FavsBuilder())),
        ),
      ),
    );
  }
}

///Separate widget for proper UI
class _FavsBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final control = Provider.of<FavsControl>(context);
    return FutureBuilder(
      future: control.getFavBreeds(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (control.favBreeds.isEmpty) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: CatTheme.paddingHead, horizontal: 30),
              child: Text(
                'No saved breeds, go explore some and add them to favourites.',
                textAlign: TextAlign.center,
              ),
            );
          }
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: control.favBreeds
                  .map<Widget>(
                    (e) => BreedCard<FavsControl>(
                      e,
                      initFav: true,
                    ),
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
