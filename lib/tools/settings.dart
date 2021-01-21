import 'dart:convert';

import 'package:app_meow/entities/breed_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'enums.dart';

class CatSettings {
  static final CatSettings _singleton = CatSettings._internal();

  factory CatSettings() {
    return _singleton;
  }

  CatSettings._internal();

  SharedPreferences _prefs;

  void setPrefs(SharedPreferences p) => _prefs ??= p;

  Units _units = Units.metric;
  final _favIds = <String>[];

  bool get isMetric => _units == Units.metric;

  Future<bool> favBreed(Breed breed) async {
    if (_prefs.containsKey(breed.id)) {
      await _prefs.remove(breed.id);
      _favIds.remove(breed.id);
      _updateIds();
      return false;
    } else {
      await _prefs.setString(breed.id, jsonEncode(breed));
      _favIds.add(breed.id);
      _updateIds();
      return true;
    }
  }

  void _updateIds() {
    _prefs.setStringList('favIds', _favIds);
  }

  Iterable<Breed> getFavBreeds() {
    final toReturn = <Breed>[];
    final ids = _prefs.getStringList('favIds');
    for (var id in ids) {
      final breed = Breed.fromJson(jsonDecode(_prefs.getString(id)));
      toReturn.add(breed);
    }
    return toReturn;
  }
}
