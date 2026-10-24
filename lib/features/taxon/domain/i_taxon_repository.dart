import 'package:my_catalog/features/taxon/domain/taxon_model.dart';

abstract interface class ITaxonRepository{
  Future<List<TaxonModel>> getTaxons();
  Future<TaxonModel?> getTaxon(int key);
  Future<List<TaxonModel>> getChildren(int parentKey);
}
