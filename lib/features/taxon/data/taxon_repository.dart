import 'package:my_catalog/features/taxon/data/mock_taxons.dart';
import 'package:my_catalog/features/taxon/domain/i_taxon_repository.dart';
import 'package:my_catalog/features/taxon/domain/taxon_model.dart';

final class TaxonRepository implements ITaxonRepository {
  const TaxonRepository();

  @override
  Future<List<TaxonModel>> getTaxons() async => mockTaxons;

  @override
  Future<TaxonModel?> getTaxon(int key) async {
    for (final taxon in mockTaxons) {
      if (taxon.key == key) return taxon;
    }
    return null;
  }

  @override
  Future<List<TaxonModel>> getChildren(int parentKey) async =>
    mockTaxons.where((t) => t.parentKey == parentKey).toList();

  @override
  Future<List<TaxonModel>> search(String query, {int? parentKey}) async {
    final base = parentKey == null
      ? mockTaxons
      : mockTaxons.where((t) => t.parentKey == parentKey).toList();

    final needle = query.trim().toLowerCase();
    if (needle.isEmpty) return base;

    return base.where((t) =>
      t.scientificName.toLowerCase().contains(needle) || (t.canonicalName?.toLowerCase().contains(needle) ?? false)
    ).toList();
  }
}
