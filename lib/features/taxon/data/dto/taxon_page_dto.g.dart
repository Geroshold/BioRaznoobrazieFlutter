// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxon_page_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxonPageDto _$TaxonPageDtoFromJson(Map<String, dynamic> json) => TaxonPageDto(
  offset: (json['offset'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  endOfRecords: json['endOfRecords'] as bool,
  count: (json['count'] as num?)?.toInt(),
  results: (json['results'] as List<dynamic>)
      .map((e) => TaxonDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TaxonPageDtoToJson(TaxonPageDto instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'limit': instance.limit,
      'endOfRecords': instance.endOfRecords,
      'count': instance.count,
      'results': instance.results,
    };
