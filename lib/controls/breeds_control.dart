import 'package:app_meow/api/api.dart';
import 'package:app_meow/entities/breed_entity.dart';
import 'package:app_meow/tools/back_navigator.dart';
import 'package:app_meow/tools/settings.dart';

class BreedsControl with BackNavigator {
  final api = Api();

  Future<Iterable<Breed>> getBreeds() async {
    return await api.apiBreeds.getBreeds();
  }

  bool addBreedToFavs(Breed breed) {
    CatSettings().favBreed(breed);
  }
}
