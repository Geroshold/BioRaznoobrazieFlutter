import 'package:my_catalog/features/taxon/data/dto/taxon_dto.dart';
import 'package:my_catalog/features/taxon/data/dto/taxon_page_dto.dart';

abstract interface class ITaxonDataSource {
  Future<TaxonPageDto> searchTaxonPage({
    String? query,
    int? highertaxonKey,
    required int offset,
    required int limit,
  });

Future<TaxonPageDto> getTaxonChildrenPage({
    required int parentKey,
    required int offset,
    required int limit,
  });

  Future<TaxonDto> getTaxon(int id);

  Future<List<DescriptionDto>> getTaxonDescriptions(int key);
}
