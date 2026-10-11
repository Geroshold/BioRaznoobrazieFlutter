import 'package:my_catalog/features/taxon/domain/taxon_model.dart';
import 'package:intl/intl.dart';

extension TaxonFormat on TaxonModel {
  String get displayName => _capitalize(scientificName);
  String get displayCanonicalName => _capitalize(canonicalName!);
  String get displayNumber => key.toString().padLeft(3, '0');
}

String _capitalize(String text) =>
    text.isEmpty ? text : text[0].toUpperCase() + text.substring(1);

String formatNumDescendants(int value, String locale) {
  return NumberFormat.decimalPattern(locale).format(value);
}