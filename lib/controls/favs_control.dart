import 'package:app_meow/entities/breed_entity.dart';
import 'package:app_meow/tools/back_navigator.dart';
import 'package:app_meow/tools/handlers/breed_handler.dart';
import 'package:app_meow/tools/settings.dart';
import 'package:dio/dio.dart';

class FavsControl extends BreedHandler with BackNavigator {
  final favBreeds = <Breed>[];
  final VoidCallback _refreshCallback;

  FavsControl(this._refreshCallback);

  Future<bool> getFavBreeds() async {
    final data = await Future.value(CatSettings().getFavBreeds());
    favBreeds.addAll(data);
    return true;
  }

  @override
  Future<bool> handleBreedFav(Breed breed) async {
    final done = await CatSettings().unfavBreed(breed);
    if (done) {
      favBreeds.remove(breed);
    }
    _refreshCallback();
    return done;
  }
}
