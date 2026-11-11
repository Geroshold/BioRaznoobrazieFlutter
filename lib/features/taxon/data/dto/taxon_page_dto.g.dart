// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxon_page_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxonPageDto _$TaxonPageDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TaxonPageDto', json, ($checkedConvert) {
      final val = TaxonPageDto(
        offset: $checkedConvert('offset', (v) => (v as num).toInt()),
        limit: $checkedConvert('limit', (v) => (v as num).toInt()),
        endOfRecords: $checkedConvert('endOfRecords', (v) => v as bool),
        count: $checkedConvert('count', (v) => (v as num?)?.toInt()),
        results: $checkedConvert(
          'results',
          (v) => (v as List<dynamic>)
              .map((e) => TaxonDto.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$TaxonPageDtoToJson(TaxonPageDto instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'limit': instance.limit,
      'endOfRecords': instance.endOfRecords,
      'count': instance.count,
      'results': instance.results,
    };
