// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Species Catalog';

  @override
  String get actionToggleTheme => 'Toggle theme';

  @override
  String taxonNumber(Object number) {
    return 'No. $number';
  }

  @override
  String get actionBack => 'Back';

  @override
  String get actionToggleLanguage => 'Switch language';

  @override
  String get rankKingdom => 'Kingdom';

  @override
  String get rankPhylum => 'Phylum';

  @override
  String get rankClass => 'Class';

  @override
  String get rankOrder => 'Order';

  @override
  String get rankFamily => 'Family';

  @override
  String get rankGenus => 'Genus';

  @override
  String get rankSpecies => 'Species';
}
