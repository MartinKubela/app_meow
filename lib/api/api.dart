import 'package:app_meow/api/api_breeds.dart';
import 'package:app_meow/tools/consts.dart';
import 'package:dio/dio.dart';

import 'api_cats.dart';

///Base API class
///
/// Contains individual api classes
/// [client] - [Dio] http client for sending HTTP requests to api
class Api {
  ///We set basic headers and api key
  final client = Dio()
    ..options.headers['content-type'] = 'application/json'
    ..options.headers['x-api-key'] = Consts.apiKey;

  ApiCats apiCats;
  ApiBreeds apiBreeds;

  ///Init of individual apis, [this] is passed for client reference
  Api() {
    apiCats = ApiCats(this);
    apiBreeds = ApiBreeds(this);
  }
}
