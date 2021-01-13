import 'package:app_meow/entities/cat_entity.dart';
import 'package:app_meow/tools/consts.dart';
import 'package:flutter/material.dart';
import 'api.dart';

class ApiCats {
  final Api api;

  ApiCats(this.api);

  Future<Iterable<Cat>> getAllCats(
      [int page = 0, int limit = 5, String order = 'Desc']) async {
    final url = '${Consts.apiUrl}images/search';

    try {
      final response = await api.client.get(url);

      if (response.statusCode == 200) {
        return [Cat.fromJson(response.data.first)];
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
