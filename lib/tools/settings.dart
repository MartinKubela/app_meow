import 'dart:convert';

import 'package:app_meow/entities/breed_entity.dart';
import 'package:app_meow/tools/parser.dart';
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

  final _favIds = <String>[];

  Units _units;

  Units get units => _units;

  bool get isMetric => _units == Units.metric;

  Future<void> initUnits() async {
    if (_prefs.containsKey('units')) {
      switch (_prefs.getString('units')) {
        case 'metric':
          _units = Units.metric;
          break;
        case 'imperial':
          _units = Units.imperial;
          break;
        default:
          _units = Units.metric;
          break;
      }
    } else {
      _units = Units.metric;
      await _prefs.setString('units', CatParser.enumValueToString(units));
    }
  }

  Future<bool> updateUnits(Units newUnits) async {
    if (_prefs.getString('units') == CatParser.enumValueToString(newUnits)) {
      return Future.value(true);
    } else {
      _units = newUnits;
      await _prefs.setString('units', CatParser.enumValueToString(units));
      return true;
    }
  }

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

  Future<bool> unfavBreed(Breed breed) async {
    if (_prefs.containsKey(breed.id)) {
      await _prefs.remove(breed.id);
      _favIds.remove(breed.id);
      _updateIds();
      return true;
    } else {
      return true;
    }
  }

  void _updateIds() {
    _prefs.setStringList('favIds', _favIds);
  }

  Iterable<Breed> getFavBreeds() {
    final toReturn = <Breed>[];
    final ids = _prefs.getStringList('favIds');
    if (ids == null || ids.isEmpty) return toReturn;
    for (var id in ids) {
      final breed = Breed.fromJson(jsonDecode(_prefs.getString(id)));
      toReturn.add(breed);
    }
    return toReturn;
  }
}
