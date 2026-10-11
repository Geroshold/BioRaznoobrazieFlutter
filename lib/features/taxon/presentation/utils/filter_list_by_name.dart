import 'package:my_catalog/features/taxon/domain/taxon_model.dart';

List<TaxonModel> filterByName(List<TaxonModel> list, String query) {
  final needle = query.trim().toLowerCase();
  if (needle.isEmpty) return list;
  return [
    for (final taxon in list)
      if (taxon.scientificName.toLowerCase().contains(needle) ||
          (taxon.canonicalName?.toLowerCase().contains(needle) ?? false))
        taxon,
  ];
}