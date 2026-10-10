import 'package:my_catalog/features/taxon/domain/taxon_rank.dart';

sealed class TaxonDetailState {
  const TaxonDetailState();
}

final class TaxonDetailLoading extends TaxonDetailState {
  const TaxonDetailLoading();
}

final class TaxonDetailLoaded extends TaxonDetailState {
  const TaxonDetailLoaded(this.taxon, {required this.hasChildren});

  final TaxonDetailUi taxon;

  final bool hasChildren;
}

final class TaxonDetailNotFound extends TaxonDetailState {
  const TaxonDetailNotFound(this.key);

  final int key;
}

class TaxonDetailUi {
  final int key;
  final String name;
  final String number;
  final TaxonRank rank;
  final String? canonicalName;
  final int numDescendants;  
  final String? description;

  const TaxonDetailUi({
    required this.key,
    required this.name,
    required this.number,
    required this.rank,
    this.canonicalName,
    required this.numDescendants,
    this.description,
  });
}