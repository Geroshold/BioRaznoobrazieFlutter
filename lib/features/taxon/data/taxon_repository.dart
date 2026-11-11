import 'package:my_catalog/features/taxon/data/data_sources/i_taxon_data_source.dart';
import 'package:my_catalog/features/taxon/domain/i_taxon_repository.dart';
import 'package:my_catalog/common/network/load_exception.dart';
import 'package:my_catalog/features/taxon/data/mappers/taxon_mapper.dart';
import 'package:my_catalog/features/taxon/domain/taxon_model.dart';
import 'package:my_catalog/features/taxon/presentation/utils/html_util.dart';

final class TaxonRepository implements ITaxonRepository {
  const TaxonRepository(this._dataSource);

  final ITaxonDataSource _dataSource;

  @override
  Future<List<TaxonModel>> getTaxons({
    required int offset,
    required int limit,
  }) async {
    final page = await _dataSource.searchTaxonPage(
      offset: offset,
      limit: limit,
    );
    final models = page.results.map((dto) => dto.toModel()).toList();
    return models;
  }

  @override
  Future<TaxonModel> getTaxon(int key) async {
    final dto = await _dataSource.getTaxon(key);
    final model = dto.toModel();

    var description = model.description;
    try {
      final descriptions = await _dataSource.getTaxonDescriptions(key);
      if (descriptions.isNotEmpty &&
          descriptions.first.description.isNotEmpty) {
        description = stripHtml(descriptions.first.description);
      }
    } on LoadException {}

    return model.copyWith(description: description);
  }

  @override
  Future<List<TaxonModel>> getChildren(int parentKey) async {
    final page = await _dataSource.getTaxonChildrenPage(
      parentKey: parentKey,
      offset: 0,
      limit: 100,
    );
    return page.results.map((dto) => dto.toModel()).toList();
  }

  @override
  Future<List<TaxonModel>> search(String query, {int? parentKey}) async {
    final page = await _dataSource.searchTaxonPage(
      query: query,
      highertaxonKey: parentKey,
      offset: 0,
      limit: 50,
    );
    return page.results.map((dto) => dto.toModel()).toList();
  }
}
