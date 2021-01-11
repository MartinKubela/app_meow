import 'package:app_meow/api/api.dart';
import 'package:app_meow/entities/cat_entity.dart';

class KittensControl {
  final api = Api();


  Future<Iterable<Cat>> getKittens() {
    api.apiCats.getAllCats();
  }
}
