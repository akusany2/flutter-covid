String camelCaseToUpperSpace(String string) {
  return string.replaceAllMapped(
      RegExp('([A-Z])'), (Match match) => ' ${match[0]}');
}
