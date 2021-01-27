/// Extension for [String]s for capitalization of first letter
extension StringExtension on String {
  String get capitalize => "${this[0].toUpperCase()}${this.substring(1)}";
}
