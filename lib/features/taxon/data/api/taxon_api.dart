import 'package:dio/dio.dart';
import 'package:my_catalog/common/network/load_exception.dart';
import 'package:my_catalog/features/taxon/data/dto/taxon_dto.dart';
import 'package:my_catalog/features/taxon/data/dto/taxon_page_dto.dart';

final class TaxonApi {
  const TaxonApi(this._dio);

  final Dio _dio;

  Future<TaxonPageDto> searchTaxonPage({
    String? query,
    int? highertaxonKey,
    required int offset,
    required int limit,
  }) async {
    final json = await _getJson(
      '/species/search',
      queryParameters: {
        if (query != null && query.isNotEmpty) 'q': query,
        'offset': offset,
        'limit': limit,
      },
    );
    return TaxonPageDto.fromJson(json);
  }

  Future<TaxonPageDto> getTaxonPage({
    required int offset,
    required int limit,
  }) async {
    final json = await _getJson(
      '/species/search',
      queryParameters: {'offset': offset, 'limit': limit},
    );
    return TaxonPageDto.fromJson(json);
  }

  Future<TaxonDto> getTaxon(int id) async =>
    TaxonDto.fromJson(await _getJson('/species/$id', queryParameters: {'verbose': 'true'}));

  Future<TaxonPageDto> getTaxonChildrenPage({
    required int parentKey,
    required int offset,
    required int limit,
  }) async {
    final json = await _getJson(
      '/species/$parentKey/children',
      queryParameters: {'offset': offset, 'limit': limit},
    );
    return TaxonPageDto.fromJson(json);
  }

  Future<Map<String, dynamic>> _getJson(
    String path, {
      Map<String, Object>? queryParameters,
    }) async {
      final response = await _dio.get<Map<String, dynamic>>(
        path,
        queryParameters: queryParameters,
      );
      return response.data ?? (throw const FormatException('Пустой ответ'));
  }

  Future<List<DescriptionDto>> getTaxonDescriptions(int key) async {
    final json = await _getJson(
      '/species/$key/descriptions',
      queryParameters: {'limit': 20},
    );
  
    final results = json['results'];
    if (results is! List) return [];
  
    return results
      .map((e) => DescriptionDto.fromJson(e as Map<String, dynamic>))
      .toList();
}
}
