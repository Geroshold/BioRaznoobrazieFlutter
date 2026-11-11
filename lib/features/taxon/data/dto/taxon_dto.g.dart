// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxon_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxonDto _$TaxonDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TaxonDto', json, ($checkedConvert) {
      final val = TaxonDto(
        key: $checkedConvert('key', (v) => (v as num).toInt()),
        scientificName: $checkedConvert('scientificName', (v) => v as String),
        canonicalName: $checkedConvert('canonicalName', (v) => v as String?),
        rank: $checkedConvert('rank', (v) => v as String),
        parentKey: $checkedConvert('parentKey', (v) => (v as num?)?.toInt()),
        numDescendants: $checkedConvert(
          'numDescendants',
          (v) => (v as num).toInt(),
        ),
        kingdom: $checkedConvert('kingdom', (v) => v as String?),
        phylum: $checkedConvert('phylum', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$TaxonDtoToJson(TaxonDto instance) => <String, dynamic>{
  'key': instance.key,
  'scientificName': instance.scientificName,
  'canonicalName': instance.canonicalName,
  'rank': instance.rank,
  'parentKey': instance.parentKey,
  'numDescendants': instance.numDescendants,
  'kingdom': instance.kingdom,
  'phylum': instance.phylum,
};

DescriptionDto _$DescriptionDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DescriptionDto', json, ($checkedConvert) {
      final val = DescriptionDto(
        description: $checkedConvert('description', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$DescriptionDtoToJson(DescriptionDto instance) =>
    <String, dynamic>{'description': instance.description};
