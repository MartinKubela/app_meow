import 'package:app_meow/entities/breed_entity.dart';
import 'package:app_meow/pages/favs_page.dart';
import 'package:app_meow/tools/back_navigator.dart';
import 'package:app_meow/tools/handlers/breed_handler.dart';
import 'package:app_meow/tools/settings.dart';
import 'package:dio/dio.dart';

///Control class for [FavsPage]
class FavsControl extends BreedHandler with BackNavigator {
  final favBreeds = <Breed>[];
  final VoidCallback _refreshCallback;

  FavsControl(this._refreshCallback);

  ///Gets breeds from API
  Future<bool> getFavBreeds() async {
    final data = await Future.value(CatSettings().getFavBreeds());
    favBreeds.addAll(data);
    return true;
  }

  ///Override of superclass method for handling breed card callback
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
