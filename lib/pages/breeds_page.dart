import 'package:app_meow/components/loading_indicator.dart';
import 'package:app_meow/controls/breeds_control.dart';
import 'package:app_meow/entities/breed_entity.dart';
import 'package:app_meow/theme.dart';
import 'package:app_meow/tools/settings.dart';
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
                              .map<Widget>(
                                (e) => _BreedCard(e),
                              )
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

const _cardSectionWidth = 80.0;

class _BreedCard extends StatelessWidget {
  final Breed breed;

  _BreedCard(this.breed, {Key key}) : super(key: key ?? ValueKey(breed.id));

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(
        left: 30,
        right: 30,
        top: 40,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: theme.backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: theme.primaryColor),
        ),
        child: Material(
          color: Colors.transparent,
          shadowColor: Colors.transparent,
          child: InkWell(
            onTap: () {},
            splashColor: theme.accentColor,
            highlightColor: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            child: Row(
              children: [
                SizedBox(width: _cardSectionWidth, child: Text(breed.name)),
                Flexible(
                  child: Column(
                    children: [
                      _InfoRow(
                          title: "Weight",
                          data: CatSettings().isMetric
                              ? breed.weight.metric
                              : breed.weight.imperial),
                      _InfoRow(title: "Lifespan", data: breed.lifeSpan),
                      _InfoRow(title: "Temperament", data: breed.temperament),
                      _InfoRow(title: "Country", data: breed.countryCode),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String title;
  final dynamic data;

  const _InfoRow({@required this.title, @required this.data, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: _cardSectionWidth, child: Text('$title:')),
        const SizedBox(
          width: 10,
        ),
        Flexible(child: Text(data.toString()))
      ],
    );
  }
}
