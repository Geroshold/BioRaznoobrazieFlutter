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

  CancelableOperation<List<TaxonModel>>? _searchOperation;
  final int _limit = 20;

  Future<void> load() async {
    emit(TaxonListLoading(query: state.query));

    try {
      final items = parentKey == null
          ? await _repository.getTaxons(offset: 0, limit: 20)
          : await _repository.getChildren(parentKey!);
      if (isClosed) return;

      final reachedMax = parentKey != null || items.length < _limit;

      emit(TaxonListLoaded(query: '', items: items, hasReachedMax: reachedMax,));
    } on LoadException catch(error) {
      if (isClosed) return;
      emit(TaxonListFailure(query: state.query, error: error));
    }
  }

  Future<void> search(String query) async {
    final current = state;
    if (current is! TaxonListLoaded) {
      emit(TaxonListLoading(query: query));
      try {
        final items = await _repository.search(query, parentKey: parentKey);
        if (isClosed) return;
        emit(TaxonListLoaded(query: query, items: items, hasReachedMax: true,));
      } on LoadException catch (error) {
        if (isClosed) return;
        emit(TaxonListFailure(query: query, error: error));
      }
      return;
    }

    emit(current.copyWith(query: query));
    _searchOperation?.cancel();
    _searchOperation = CancelableOperation.fromFuture(
      _repository.search(query, parentKey: parentKey),
    );

    try {
      final items = await _searchOperation!.valueOrCancellation();
      if (isClosed) return;
      if (items == null) return;

      emit(TaxonListLoaded(query: query, items: items, hasReachedMax: true,));
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

    emit(currentState.copyWith(isLoadingMore: true));

    try {
      final nextItems = await _repository.getTaxons(
        offset: currentState.items.length,
        limit: _limit,
      );
      
      if (isClosed) return;

      if (nextItems.isEmpty) {
        emit(currentState.copyWith(isLoadingMore: false, hasReachedMax: true));
      } else {
        emit(currentState.copyWith(
          items: [...currentState.items, ...nextItems],
          isLoadingMore: false,
          hasReachedMax: nextItems.length < _limit,
        ));
      }
    } on LoadException {
      if (isClosed) return;
      emit(currentState.copyWith(isLoadingMore: false)); 
    }
  }
}
