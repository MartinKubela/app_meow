import 'package:app_meow/entities/breed_entity.dart';

///Abstract class for providing [BreedHandler] type
///and [handleBreedFav] method
abstract class BreedHandler {
  Future<bool> handleBreedFav(Breed breed);
}
