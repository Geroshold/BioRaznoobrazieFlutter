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
  const TaxonListLoaded({
    required super.query,
    required this.items,
    this.isLoadingMore = false,
    this.hasReachedMax = false,
    this.loadMoreError,
    });

  final List<TaxonModel> items;
  final bool isLoadingMore;
  final bool hasReachedMax;
  final LoadException? loadMoreError;

  TaxonListLoaded copyWith({
    String? query,
    List<TaxonModel>? items,
    bool? isLoadingMore,
    bool? hasReachedMax,
    LoadException? loadMoreError,
  }) {
    return TaxonListLoaded(
      query: query ?? this.query,
      items: items ?? this.items,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      loadMoreError: loadMoreError ?? this.loadMoreError,
    );
  }
}

final class TaxonListFailure extends TaxonListState {
  const TaxonListFailure({required super.query, required this.error});

  final LoadException error;
}
