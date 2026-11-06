import 'package:json_annotation/json_annotation.dart';
import 'package:my_catalog/features/taxon/data/dto/taxon_dto.dart';

part 'taxon_page_dto.g.dart';

@JsonSerializable()
class TaxonPageDto {
  const TaxonPageDto({
    required this.offset,
    required this.limit,
    required this.endOfRecords,
    this.count,
    required this.results,
  });

  factory TaxonPageDto.fromJson(Map<String, dynamic> json) =>
    _$TaxonPageDtoFromJson(json);

  final int offset;

  final int limit;

  @JsonKey(name: 'endOfRecords')
  final bool endOfRecords;

  final int? count;

  final List<TaxonDto> results;
}