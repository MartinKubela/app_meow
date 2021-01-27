import 'package:app_meow/api/api.dart';
import 'package:app_meow/entities/cat_entity.dart';
import 'package:app_meow/pages/kittens_page.dart';
import 'package:app_meow/tools/back_navigator.dart';

///Control class for [KittensPage]
class KittensControl with BackNavigator {
  final api = Api();

  ///Gets kittens from API
  Future<Iterable<Cat>> getKittens() async {
    return await api.apiCats.getAllCats();
  }
}
