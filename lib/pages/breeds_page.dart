import 'package:app_meow/components/loading_indicator.dart';
import 'package:app_meow/components/page_layout.dart';
import 'package:app_meow/controls/breeds_control.dart';
import 'package:app_meow/entities/breed_entity.dart';
import 'package:app_meow/tools/settings.dart';
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
                    (e) => _BreedCard(e),
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

const _cardSectionWidth = 80.0;

class _BreedCard extends StatefulWidget {
  final Breed breed;

  _BreedCard(this.breed, {Key key}) : super(key: key ?? ValueKey(breed.id));

  @override
  __BreedCardState createState() => __BreedCardState();
}

class __BreedCardState extends State<_BreedCard> {
  Breed get breed => widget.breed;

  bool _fav = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final control = Provider.of<BreedsControl>(context);
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
            onTap: () async {
              final isFav = await control.addBreedToFavs(breed);
              setState(() {
                _fav = isFav;
              });
            },
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
                ),
                Icon(
                  _fav ? Icons.star : Icons.star_border,
                  color: _fav ? Colors.amber : Colors.grey,
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
