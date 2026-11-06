// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxon_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxonDto _$TaxonDtoFromJson(Map<String, dynamic> json) => TaxonDto(
  key: (json['key'] as num).toInt(),
  scientificName: json['scientificName'] as String,
  canonicalName: json['canonicalName'] as String?,
  rank: json['rank'] as String,
  parentKey: (json['parentKey'] as num?)?.toInt(),
  numDescendants: (json['numDescendants'] as num).toInt(),
  kingdom: json['kingdom'] as String?,
  phylum: json['phylum'] as String?,
  descriptions: (json['descriptions'] as List<dynamic>?)
      ?.map((e) => DescriptionDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TaxonDtoToJson(TaxonDto instance) => <String, dynamic>{
  'key': instance.key,
  'scientificName': instance.scientificName,
  'canonicalName': instance.canonicalName,
  'rank': instance.rank,
  'parentKey': instance.parentKey,
  'numDescendants': instance.numDescendants,
  'kingdom': instance.kingdom,
  'phylum': instance.phylum,
  'descriptions': instance.descriptions,
};

DescriptionDto _$DescriptionDtoFromJson(Map<String, dynamic> json) =>
    DescriptionDto(description: json['description'] as String);

Map<String, dynamic> _$DescriptionDtoToJson(DescriptionDto instance) =>
    <String, dynamic>{'description': instance.description};
