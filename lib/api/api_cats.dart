import 'file:///C:/Users/Work/dev/app_meow/lib/api/api.dart';
import 'file:///C:/Users/Work/dev/app_meow/lib/entities/cat_entity.dart';
import 'package:app_meow/tools/consts.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';

class ApiCats {

  final api = KiwiContainer().resolve<Api>();

  Future<Iterable<Cat>> getAllCats([ int page = 0,int limit = 5, String order = 'Desc' ] ) async {
    final url = '${Consts.apiUrl}/images/search?limit=$limit&page=$page&order=$order';

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