import 'package:app_meow/tools/consts.dart';
import 'package:dio/dio.dart';

import 'api_cats.dart';

class Api {
  final client = Dio()
    ..options.headers['content-type'] = 'application/json'
    ..options.headers['x-api-key'] = Consts.apiKey;

  ApiCats apiCats;

  Api() {
    apiCats = ApiCats(this);
  }
}
