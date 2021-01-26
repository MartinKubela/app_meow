import 'package:app_meow/entities/breed_entity.dart';
import 'package:app_meow/tools/back_navigator.dart';
import 'package:app_meow/tools/settings.dart';
import 'package:dio/dio.dart';

class FavsControl with BackNavigator {
  final favBreeds = <Breed>[];
  final VoidCallback _refreshCallback;

  FavsControl(this._refreshCallback);

  Future<bool> getFavBreeds() async {
    final data = await Future.value(CatSettings().getFavBreeds());
    favBreeds.addAll(data);
    return true;
  }

  Future<bool> removeFromFavs(Breed breed) async {
    final done = await CatSettings().unfavBreed(breed);
    if (done) {
      favBreeds.remove(breed);
    }
    return done;
  }

  void refresh() => _refreshCallback();
}
