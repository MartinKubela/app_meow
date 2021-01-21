import 'enums.dart';

class CatSettings {
  static final CatSettings _singleton = CatSettings._internal();

  factory CatSettings() {
    return _singleton;
  }

  CatSettings._internal();

  Units _units = Units.metric;

  bool get isMetric => _units == Units.metric;
}
