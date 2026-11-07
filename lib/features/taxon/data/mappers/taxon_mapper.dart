import 'package:my_catalog/features/taxon/data/dto/taxon_dto.dart';
import 'package:my_catalog/features/taxon/domain/taxon_model.dart';
import 'package:my_catalog/features/taxon/domain/taxon_rank.dart';

extension TaxonDtoMapper on TaxonDto {
  TaxonModel toModel() => TaxonModel(
    key: key,
    scientificName: scientificName,
    canonicalName: canonicalName,
    rank: _parseTaxonRank(rank),
    parentKey: parentKey,
    numDescendants: numDescendants,
    kingdom: kingdom,
    phylum: phylum,
    description: null,
  );
}

TaxonRank _parseTaxonRank(String raw) => TaxonRank.values.firstWhere(
  (r) => r.name.toUpperCase() == raw.toUpperCase(),
  orElse: () => TaxonRank.species,
);
