import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_catalog/features/taxon/domain/i_taxon_repository.dart';
import 'package:my_catalog/features/taxon/presentation/cubit/list/taxon_list_state.dart';
import 'package:my_catalog/features/taxon/presentation/utils/filter_list_by_name.dart';

class TaxonListCubit extends Cubit<TaxonListState> {
  TaxonListCubit(this._repository, {this.parentKey}) : super(const TaxonListLoading());

  final ITaxonRepository _repository;
  final int? parentKey;

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

    final base = parentKey == null
      ? await _repository.getTaxons()
      : await _repository.getChildren(parentKey!);

    final items = filterByName(base, query);
    if (isClosed) return;
    emit(TaxonListLoaded(query: query, items: items));
  }
}
