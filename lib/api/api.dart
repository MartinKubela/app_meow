import 'package:app_meow/api/api_breeds.dart';
import 'package:app_meow/tools/consts.dart';
import 'package:dio/dio.dart';

import 'api_cats.dart';

class Api {
  final client = Dio()
    ..options.headers['content-type'] = 'application/json'
    ..options.headers['x-api-key'] = Consts.apiKey;

  ApiCats apiCats;
  ApiBreeds apiBreeds;

  Api() {
    apiCats = ApiCats(this);
    apiBreeds = ApiBreeds(this);
  }
}
