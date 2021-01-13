class CatParser {
  static String enumValueToString(dynamic value) =>
      value.toString().substring(value.toString().indexOf('.') + 1);
}
