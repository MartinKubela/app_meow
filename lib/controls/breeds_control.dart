import 'package:app_meow/api/api.dart';
import 'package:app_meow/entities/breed_entity.dart';
import 'package:app_meow/tools/back_navigator.dart';
import 'package:app_meow/tools/handlers/breed_handler.dart';
import 'package:app_meow/tools/settings.dart';

class BreedsControl extends BreedHandler with BackNavigator {
  final api = Api();

  Future<Iterable<Breed>> getBreeds() async {
    return await api.apiBreeds.getBreeds();
  }

  @override
  Future<bool> handleBreedFav(Breed breed) async {
    return await CatSettings().favBreed(breed);
  }
}
