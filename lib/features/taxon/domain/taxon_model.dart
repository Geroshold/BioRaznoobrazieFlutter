import 'package:my_catalog/features/taxon/domain/taxon_rank.dart';

final class TaxonModel {
  const TaxonModel({
    required this.key,
    required this.scientificName,
    this.canonicalName,
    required this.rank,
    this.parentKey,
    required this.numDescendants,
    this.kingdom,
    this.phylum,
    this.description,
  });

  final int key;
  final String scientificName;
  final String? canonicalName;
  final TaxonRank rank;
  final int? parentKey;
  final int numDescendants;
  final String? kingdom;
  final String? phylum;
  final String? description;

  TaxonModel copyWith({String? description}) => TaxonModel(
  key: key,
  scientificName: scientificName,
  canonicalName: canonicalName,
  rank: rank,
  parentKey: parentKey,
  numDescendants: numDescendants,
  kingdom: kingdom,
  phylum: phylum,
  description: description ?? this.description,
);
}
