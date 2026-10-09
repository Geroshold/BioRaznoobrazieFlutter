import 'package:my_catalog/features/data/mock_taxons.dart';
import 'package:my_catalog/features/domain/i_taxon_repository.dart';
import 'package:my_catalog/features/domain/taxon_model.dart';

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
}