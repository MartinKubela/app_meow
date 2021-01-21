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

  bool get isMetric => _units == Units.metric;

  Future<bool> favBreed(Breed breed) async {
    if (_prefs.containsKey(breed.id)) {
      await _prefs.remove(breed.id);
      return false;
    } else {
      await _prefs.setString(breed.id, jsonEncode(breed));
      return true;
    }
  }
}
