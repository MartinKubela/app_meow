import 'package:app_meow/entities/breed_entity.dart';
import 'package:app_meow/tools/back_navigator.dart';
import 'package:app_meow/tools/settings.dart';

class FavsControl with BackNavigator {
  Future<Iterable<Breed>> getFavBreeds() async {
    return Future.value(CatSettings().getFavBreeds());
  }
}
