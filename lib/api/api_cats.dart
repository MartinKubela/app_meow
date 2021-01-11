

import 'package:app_meow/entities/cat_entity.dart';
import 'package:app_meow/tools/consts.dart';
import 'package:flutter/material.dart';
import 'api.dart';

class ApiCats {
  final Api api;

  ApiCats(this.api);

  Future<Iterable<Cat>> getAllCats(
      [int page = 0, int limit = 5, String order = 'Desc']) async {
    final url =
        '${Consts.apiUrl}/images/search?limit=$limit&page=$page&order=$order';

    try {
      final response = await api.client.put(url);

      if (response.statusCode == 200) {
        return [];
      } else {
        debugPrint('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode;
      }
    } catch (error) {
      debugPrint(error);
    }
  }
}
