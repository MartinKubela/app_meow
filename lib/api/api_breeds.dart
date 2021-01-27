import 'package:app_meow/entities/breed_entity.dart';
import 'package:app_meow/tools/consts.dart';
import 'package:flutter/material.dart';

import 'api.dart';

///Api responsible for getting breeds from REST
class ApiBreeds {
  final Api api;

  ApiBreeds(this.api);

  ///Gets breeds and parse them into [Breed] entities
  Future<Iterable<Breed>> getBreeds(
      [int page = 0, int limit = 5, String order = 'Desc']) async {
    final url = '${Consts.apiUrl}breeds';

    try {
      final response = await api.client.get(url);

      if (response.statusCode == 200) {
        final breeds = <Breed>[];
        for (var json in response.data) {
          breeds.add(Breed.fromJson(json));
        }
        return breeds;
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
