import 'dart:convert';

import 'package:app_meow/entities/breed_entity.dart';
import 'package:app_meow/pages/settings_page.dart';
import 'package:app_meow/tools/parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'enums.dart';

///App setting class, used for offline handling, init handling and other stuff
class CatSettings {
  /// ----- Singleton initializer -----
  static final CatSettings _singleton = CatSettings._internal();

  factory CatSettings() {
    return _singleton;
  }

  CatSettings._internal();

  /// ---- ----

  SharedPreferences _prefs;

  void setPrefs(SharedPreferences p) => _prefs ??= p;

  final _favIds = <String>[];

  List<String> get favourites => _favIds;

  Units _units;

  Units get units => _units;

  bool get isMetric => _units == Units.metric;

  ///If units are stored in offline storage load them, othervise save [Units.metric] as default
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

  /// Update units from [SettingsPage]
  Future<bool> updateUnits(Units newUnits) async {
    if (_prefs.getString('units') == CatParser.enumValueToString(newUnits)) {
      return Future.value(true);
    } else {
      _units = newUnits;
      await _prefs.setString('units', CatParser.enumValueToString(units));
      return true;
    }
  }

  ///Save breed into favourites, save its key for offline loading
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

  /// Removes breed from favourites
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

  /// Save all ids for later loading back
  void _updateIds() {
    _prefs.setStringList('favIds', _favIds);
  }

  /// Load favourtites breeds from offline storage based on their saved ids
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
