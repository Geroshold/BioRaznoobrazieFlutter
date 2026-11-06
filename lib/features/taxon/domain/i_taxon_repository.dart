import 'package:my_catalog/features/taxon/domain/taxon_model.dart';

abstract interface class ITaxonRepository{
  Future<List<TaxonModel>> getTaxons({
    required int offset,
    required int limit,
  });
  Future<TaxonModel> getTaxon(int key);
  Future<List<TaxonModel>> getChildren(int parentKey);
  Future<List<TaxonModel>> search(String query, {int? parentKey});
}
