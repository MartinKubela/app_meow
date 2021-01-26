import 'package:app_meow/entities/breed_entity.dart';

abstract class BreedHandler {
  Future<bool> handleBreedFav(Breed breed);
}
