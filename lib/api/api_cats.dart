import 'package:app_meow/entities/cat_entity.dart';
import 'package:app_meow/tools/consts.dart';
import 'package:flutter/material.dart';

import 'api.dart';

///Api responsible for getting cats from REST
class ApiCats {
  final Api api;

  ApiCats(this.api);

  ///Gets cats and parse them into [Cat] entities
  Future<Iterable<Cat>> getAllCats(
      [int page = 0, int limit = 5, String order = 'Desc']) async {
    final url = '${Consts.apiUrl}images/search?limit=$limit&page=$page&order=$order';

    try {
      final response = await api.client.get(url);

      if (response.statusCode == 200) {
        final cats = <Cat>[];
        for (var json in response.data) {
          cats.add(Cat.fromJson(json));
        }
        return cats;
      } else {
        debugPrint('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode;
      }
    } catch (error) {
      debugPrint(error.toString());
      rethrow;
    }
  }
}
