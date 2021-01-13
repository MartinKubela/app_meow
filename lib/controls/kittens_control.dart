import 'package:app_meow/api/api.dart';
import 'package:app_meow/entities/cat_entity.dart';
import 'package:app_meow/tools/back_navigator.dart';

class KittensControl with BackNavigator {
  final api = Api();

  Future<Iterable<Cat>> getKittens() async {
    return await api.apiCats.getAllCats();
  }
}
