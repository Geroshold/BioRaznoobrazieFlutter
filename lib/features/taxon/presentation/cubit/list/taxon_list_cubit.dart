import 'package:async/async.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_catalog/common/network/load_exception.dart';
import 'package:my_catalog/features/taxon/domain/taxon_model.dart';
import 'package:my_catalog/features/taxon/domain/i_taxon_repository.dart';
import 'package:my_catalog/features/taxon/presentation/cubit/list/taxon_list_state.dart';

class TaxonListCubit extends Cubit<TaxonListState> {
  TaxonListCubit(this._repository, {this.parentKey})
    : super(const TaxonListLoading(query: ''));

  final ITaxonRepository _repository;
  final int? parentKey;

  CancelableOperation<void>? _operation;

  final int _limit = 20;

  Future<void> load() async {
    _operation?.cancel();

    emit(TaxonListLoading(query: state.query));

    _operation = CancelableOperation.fromFuture(_loadData());
    await _operation!.valueOrCancellation();
  }

  Future<void> retry() async {
    if (state.query.isNotEmpty) {
      await search(state.query);
    } else {
      await load();
    }
  }

  Future<void> _loadData() async {
    try {
      final items = parentKey == null
          ? await _repository.getTaxons(offset: 0, limit: _limit)
          : await _repository.getChildren(parentKey!);
      if (isClosed) return;

      final reachedMax = parentKey != null || items.length < _limit;

      emit(TaxonListLoaded(query: '', items: items, hasReachedMax: reachedMax));
    } on LoadException catch (error) {
      if (isClosed) return;
      emit(TaxonListFailure(query: state.query, error: error));
    }
  }

  Future<void> search(String query) async {
    if (query.isEmpty) {
      await load();
      return;
    }

    _operation?.cancel();
    emit(TaxonListLoading(query: query));
    _operation = CancelableOperation.fromFuture(_searchData(query));
    await _operation!.valueOrCancellation();
  }

  Future<void> _searchData(String query) async {
    try {
      final items = await _repository.search(query, parentKey: parentKey);
      if (isClosed) return;

      emit(TaxonListLoaded(query: query, items: items, hasReachedMax: true));
    } on LoadException catch (error) {
      if (isClosed) return;
      emit(TaxonListFailure(query: query, error: error));
    }
  }

  Future<void> fetchNextPage() async {
    final currentState = state;
    if (currentState is! TaxonListLoaded ||
        currentState.isLoadingMore ||
        currentState.hasReachedMax ||
        currentState.query.isNotEmpty ||
        parentKey != null) {
      return;
    }

    final loading = currentState.copyWith(
      isLoadingMore: true,
      clearLoadMoreError: true,
    );
    emit(loading);

    try {
      final nextItems = await _repository.getTaxons(
        offset: currentState.items.length,
        limit: _limit,
      );

      if (isClosed) return;

      if (!identical(state, loading)) return;

      if (nextItems.isEmpty) {
        emit(currentState.copyWith(isLoadingMore: false, hasReachedMax: true));
      } else {
        emit(
          currentState.copyWith(
            items: [...currentState.items, ...nextItems],
            isLoadingMore: false,
            hasReachedMax: nextItems.length < _limit,
          ),
        );
      }
    } on LoadException catch (error) {
      if (isClosed) return;
      if (!identical(state, loading)) return;
      emit(currentState.copyWith(isLoadingMore: false, loadMoreError: error));
    }
  }
}
