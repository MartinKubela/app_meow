import 'package:app_meow/api/api.dart';
import 'package:app_meow/entities/breed_entity.dart';
import 'package:app_meow/pages/breeds_page.dart';
import 'package:app_meow/tools/back_navigator.dart';
import 'package:app_meow/tools/handlers/breed_handler.dart';
import 'package:app_meow/tools/settings.dart';
import 'package:flutter/cupertino.dart';

class BreedsControl extends BreedHandler with BackNavigator {
  final api = Api();
  final GlobalKey<BreedsListState> _listState;
  List<Breed> breeds = <Breed>[];
  final List<Breed> _allBreeds = <Breed>[];

  TextEditingController filterInput = TextEditingController();

  BreedsControl(this._listState) {
    filterInput.addListener(() {
      _listState.currentState.setState(
        () => breeds = _allBreeds
            .where((b) =>
                b.name.toLowerCase().contains(filterInput.text.toLowerCase()))
            .toList(growable: false),
      );
    });
  }

  Future<Iterable<Breed>> getBreeds() async {
    final _breeds = await api.apiBreeds.getBreeds();
    _allBreeds.addAll(_breeds);
    breeds = _allBreeds;
    return _breeds;
  }

  @override
  Future<bool> handleBreedFav(Breed breed) async {
    return await CatSettings().favBreed(breed);
  }
}
