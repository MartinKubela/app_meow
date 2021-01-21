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

  Future<void> favBreed(Breed breed) {}
}
