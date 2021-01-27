///Parser

class CatParser {
  ///Parses enum value into string, coz dart cant do that
  ///
  /// e.g. Units.metric => 'metric'
  static String enumValueToString(dynamic value) =>
      value.toString().substring(value.toString().indexOf('.') + 1);
}
