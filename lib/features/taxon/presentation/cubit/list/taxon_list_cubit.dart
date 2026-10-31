import 'package:async/async.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_catalog/features/taxon/domain/taxon_model.dart';
import 'package:my_catalog/features/taxon/domain/i_taxon_repository.dart';
import 'package:my_catalog/features/taxon/presentation/cubit/list/taxon_list_state.dart';

class TaxonListCubit extends Cubit<TaxonListState> {
  TaxonListCubit(this._repository, {this.parentKey}) : super(const TaxonListLoading());

  final ITaxonRepository _repository;
  final int? parentKey;

  CancelableOperation<List<TaxonModel>>? _searchOperation;

  Future<void> load() async {
    emit(const TaxonListLoading());
    final items = parentKey == null
        ? await _repository.getTaxons()
        : await _repository.getChildren(parentKey!);
    if (isClosed) return;
    emit(TaxonListLoaded(query: '', items: items));
  }

  Future<void> search(String query) async {
    final current = state;
    if (current is! TaxonListLoaded) return;

    emit(TaxonListLoaded(query: query, items: current.items));

    _searchOperation?.cancel();
    _searchOperation = CancelableOperation.fromFuture(
      _repository.search(query, parentKey: parentKey),
    );

    final items = await _searchOperation!.valueOrCancellation();

    if (isClosed) return;
    if (items == null) return;

    emit(TaxonListLoaded(query: query, items: items));
  }
}
