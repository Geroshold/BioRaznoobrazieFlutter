// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Каталог видов';

  @override
  String get actionToggleTheme => 'Переключить тему';

  @override
  String taxonNumber(Object number) {
    return 'No. $number';
  }

  @override
  String get actionBack => 'Назад';

  @override
  String get actionToggleLanguage => 'Переключить язык';

  @override
  String get rankKingdom => 'Царство';

  @override
  String get rankPhylum => 'Тип';

  @override
  String get rankClass => 'Класс';

  @override
  String get rankOrder => 'Отряд';

  @override
  String get rankFamily => 'Семейство';

  @override
  String get rankGenus => 'Род';

  @override
  String get rankSpecies => 'Вид';
}
