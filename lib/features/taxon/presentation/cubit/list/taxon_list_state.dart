import 'package:my_catalog/features/taxon/domain/taxon_model.dart';

sealed class TaxonListState {
  const TaxonListState();
}

final class TaxonListLoading extends TaxonListState {
  const TaxonListLoading();
}

final class TaxonListLoaded extends TaxonListState {
  const TaxonListLoaded({required this.query, required this.items});

  final String query;
  final List<TaxonModel> items;
}
