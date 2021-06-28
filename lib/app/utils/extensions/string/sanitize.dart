extension SanitizeExtension on String {
  bool matches(String pattern) {
    final RegExp regExp = RegExp(pattern.sanatize);
    return regExp.hasMatch(sanatize);
  }

  String get removeAccentuation {
    return replaceAll('Â', 'A')
        .replaceAll('À', 'A')
        .replaceAll('Á', 'A')
        .replaceAll('Ä', 'A')
        .replaceAll('Ã', 'A')
        .replaceAll('Ê', 'E')
        .replaceAll('È', 'E')
        .replaceAll('É', 'E')
        .replaceAll('Ë', 'E')
        .replaceAll('Î', 'I')
        .replaceAll('Í', 'I')
        .replaceAll('Ì', 'I')
        .replaceAll('Ï', 'I')
        .replaceAll('Ô', 'O')
        .replaceAll('Õ', 'O')
        .replaceAll('Ò', 'O')
        .replaceAll('Ó', 'O')
        .replaceAll('Ö', 'O')
        .replaceAll('Û', 'U')
        .replaceAll('Ù', 'U')
        .replaceAll('Ú', 'U')
        .replaceAll('Ü', 'U')
        .replaceAll('Ç', 'C')
        .replaceAll('Ý', 'Y')
        .replaceAll('Ñ', 'N')
        .replaceAll('â', 'a')
        .replaceAll('à', 'a')
        .replaceAll('á', 'a')
        .replaceAll('ä', 'a')
        .replaceAll('ã', 'a')
        .replaceAll('ê', 'e')
        .replaceAll('è', 'e')
        .replaceAll('é', 'e')
        .replaceAll('ë', 'e')
        .replaceAll('î', 'i')
        .replaceAll('ì', 'i')
        .replaceAll('í', 'i')
        .replaceAll('ï', 'i')
        .replaceAll('ô', 'o')
        .replaceAll('õ', 'o')
        .replaceAll('ò', 'o')
        .replaceAll('ó', 'o')
        .replaceAll('ö', 'o')
        .replaceAll('û', 'u')
        .replaceAll('ù', 'u')
        .replaceAll('ú', 'u')
        .replaceAll('ü', 'u')
        .replaceAll('ç', 'c')
        .replaceAll('ñ', 'n');
  }

  String get removeSpecialSymbols {
    return replaceAll('|', '')
        .replaceAll('~', '')
        .replaceAll('^', '')
        .replaceAll('`', '')
        .replaceAll('´', '')
        .replaceAll('ª', '')
        .replaceAll('º', '')
        .replaceAll('{', '')
        .replaceAll('}', '')
        .replaceAll('<', '')
        .replaceAll('>', '')
        .replaceAll(']', '')
        .replaceAll('[', '')
        .replaceAll('!', '')
        .replaceAll('@', '')
        .replaceAll('\$', '')
        .replaceAll('%', '')
        .replaceAll('&', '')
        .replaceAll('_', '')
        .replaceAll(',', '')
        .replaceAll('.', '')
        .replaceAll('/', '')
        .replaceAll('+', '')
        .replaceAll('-', '')
        .replaceAll('+', '')
        .replaceAll('*', '')
        .replaceAll('+', '')
        .replaceAll('#', '');
  }

  String get sanatize {
    return replaceAll(' ', '').toUpperCase().removeAccentuation.removeSpecialSymbols;
  }
}
