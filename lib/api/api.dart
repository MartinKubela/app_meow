import 'package:dio/dio.dart';

import 'api_cats.dart';

class Api {
  final client = Dio()..options.headers['content-type'] = 'application/json';

  final apiCats = ApiCats();
}