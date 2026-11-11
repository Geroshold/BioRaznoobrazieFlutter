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

  @override
  String get rankUnknown => 'Неизвестный';

  @override
  String get sectionDescription => 'Описание';

  @override
  String get sectionChildren => 'Дочерние таксоны';

  @override
  String get detailNotFound => 'Таксон не был найден';

  @override
  String get pageNotFound => 'Страница не найдена';

  @override
  String get detailCanonicalName => 'Каноническое название';

  @override
  String get detailDescendants => 'Количество потомков';

  @override
  String get childrenEmpty => 'Дочерних таксонов нет';

  @override
  String get searchHint => 'Поиск по имени';

  @override
  String get actionClearSearch => 'Очистить поиск';

  @override
  String get searchEmpty => 'Ничего не найдено';

  @override
  String get errorNoConnection => 'Нет связи с сервером. Проверьте интернет';

  @override
  String get errorTimeout => 'Сервер долго не отвечает';

  @override
  String get errorNotFound => 'Такой записи нет';

  @override
  String errorServer(Object code) {
    return 'Ошибка сервера ($code)';
  }

  @override
  String get errorBadResponse => 'Сервер прислал непонятный ответ';

  @override
  String get actionRetry => 'Повторить';

  @override
  String get notSpecified => 'Не указано';
}
