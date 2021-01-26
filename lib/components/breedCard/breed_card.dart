import 'package:app_meow/entities/breed_entity.dart';
import 'package:app_meow/tools/handlers/breed_handler.dart';
import 'package:app_meow/tools/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _cardSectionWidth = 100.0;

class BreedCard<T extends BreedHandler> extends StatefulWidget {
  final Breed breed;
  final bool initFav;

  BreedCard(this.breed, {this.initFav = false, Key key})
      : super(key: key ?? ValueKey(breed.id));

  @override
  __BreedCardState createState() => __BreedCardState<T>();
}

class __BreedCardState<T extends BreedHandler> extends State<BreedCard> {
  Breed get breed => widget.breed;

  bool _fav = false;

  @override
  Widget build(BuildContext context) {
    _fav = widget.initFav;
    _fav = CatSettings().favourites.contains(breed.id) ? true : false;
    final theme = Theme.of(context);
    final control = Provider.of<T>(context);
    return Padding(
      padding: EdgeInsets.only(
        left: 30,
        right: 30,
        top: 40,
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [theme.accentColor, theme.primaryColor],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: theme.primaryColor),
        ),
        child: Material(
          color: Colors.transparent,
          shadowColor: Colors.transparent,
          child: InkWell(
            onTap: () async {
              final isFav = await control.handleBreedFav(breed);
              setState(() {
                _fav = isFav;
              });
            },
            splashColor: theme.accentColor,
            highlightColor: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        breed.name,
                        style: theme.textTheme.subtitle1
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      _fav ? Icons.star : Icons.star_border,
                      color: _fav ? Colors.amber : theme.primaryColor,
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
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
    final theme = Theme.of(context);
    final cardText = theme.textTheme.bodyText2.copyWith(color: Colors.white);
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        children: [
          SizedBox(
              width: _cardSectionWidth,
              child: Text(
                '$title:',
                style: cardText,
              )),
          const SizedBox(
            width: 10,
          ),
          Flexible(
              child: Text(
            data.toString(),
            style: cardText,
          ))
        ],
      ),
    );
  }
}
