import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_catalog/common/network/load_exception.dart';
import 'package:my_catalog/features/taxon/data/api/taxon_api.dart';
import 'package:my_catalog/features/taxon/data/data_sources/i_taxon_data_source.dart';
import 'package:my_catalog/features/taxon/data/dto/taxon_dto.dart';
import 'package:my_catalog/features/taxon/data/dto/taxon_page_dto.dart';

final class NetworkTaxonDataSource implements ITaxonDataSource {
  const NetworkTaxonDataSource(this._api);

  final TaxonApi _api;

  @override
  Future<TaxonPageDto> searchTaxonPage({
    String? query,
    int? highertaxonKey,
    required int offset,
    required int limit,
  }) => _guard(() => _api.searchTaxonPage(query: query, offset: offset, limit: limit));

  @override
  Future<TaxonDto> getTaxon(int id) =>
      _guard(() => _api.getTaxon(id));

  @override
  Future<TaxonPageDto> getTaxonChildrenPage({
    required int parentKey,
    required int offset,
    required int limit,
  }) => _guard(() => _api.getTaxonChildrenPage(parentKey: parentKey, offset: offset, limit: limit));

  @override
  Future<List<DescriptionDto>> getTaxonDescriptions(int key) =>
    _guard(() => _api.getTaxonDescriptions(key));

  Future<T> _guard<T>(Future<T> Function() request) async {
    try {
      return await request();
    } on DioException catch (error) {
      throw _fromDio(error);
    } on CheckedFromJsonException {
      throw const BadResponseException();
    } on FormatException {
      throw const BadResponseException();
    }
  }

  LoadException _fromDio(DioException error) => switch (error.type) {
    DioExceptionType.connectionTimeout ||
    DioExceptionType.sendTimeout ||
    DioExceptionType.receiveTimeout ||
    DioExceptionType.transformTimeout => const TimeoutLoadException(),
    DioExceptionType.badResponse when error.response?.statusCode == 404 =>
      const NotFoundException(),
    DioExceptionType.badResponse => ServerException(error.response?.statusCode),
    DioExceptionType.unknown when error.error is FormatException =>
      const BadResponseException(),
    DioExceptionType.connectionError ||
    DioExceptionType.badCertificate ||
    DioExceptionType.cancel ||
    DioExceptionType.unknown => const NoConnectionException(),
  };
}
