import 'package:my_catalog/features/domain/taxon_model.dart';

abstract interface class ITaxonRepository{
  Future<List<TaxonModel>> getTaxons();
  Future<TaxonModel?> getTaxon(int key);
}