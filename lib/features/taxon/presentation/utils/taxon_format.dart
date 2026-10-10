import 'package:my_catalog/features/taxon/domain/taxon_model.dart';

extension TaxonFormat on TaxonModel {
  String get displayName => _capitalize(scientificName);

  String get displayNumber => key.toString().padLeft(3, '0');
}

String _capitalize(String text) =>
    text.isEmpty ? text : text[0].toUpperCase() + text.substring(1);