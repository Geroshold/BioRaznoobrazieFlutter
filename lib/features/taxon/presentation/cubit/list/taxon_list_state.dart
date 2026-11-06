import 'package:my_catalog/common/network/load_exception.dart';
import 'package:my_catalog/features/taxon/domain/taxon_model.dart';

sealed class TaxonListState {
  const TaxonListState({required this.query});
  final String query;
}

final class TaxonListLoading extends TaxonListState {
  const TaxonListLoading({required super.query});
}

final class TaxonListLoaded extends TaxonListState {
  const TaxonListLoaded({required super.query, required this.items});

  final List<TaxonModel> items;
}

final class TaxonListFailure extends TaxonListState {
  const TaxonListFailure({required super.query, required this.error});

  final LoadException error;
}
