import 'package:json_annotation/json_annotation.dart';

part 'taxon_dto.g.dart';

@JsonSerializable()
class TaxonDto {
  const TaxonDto({
    required this.key,
    required this.scientificName,
    this.canonicalName,
    required this.rank,
    this.parentKey,
    required this.numDescendants,
    this.kingdom,
    this.phylum,
    this.descriptions,
  });

  factory TaxonDto.fromJson(Map<String, dynamic> json) =>
      _$TaxonDtoFromJson(json);

  final int key;
  final String scientificName;
  final String? canonicalName;
  final String rank;

  @JsonKey(name: 'parentKey')
  final int? parentKey;

  @JsonKey(name: 'numDescendants')
  final int numDescendants;

  final String? kingdom;
  final String? phylum;
  final List<DescriptionDto>? descriptions;
}

@JsonSerializable()
class DescriptionDto {
  const DescriptionDto({required this.description});

  factory DescriptionDto.fromJson(Map<String, dynamic> json) =>
      _$DescriptionDtoFromJson(json);

  final String description;
}
