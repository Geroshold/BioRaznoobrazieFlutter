import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_catalog/features/taxon/domain/i_taxon_repository.dart';
import 'package:my_catalog/features/taxon/presentation/cubit/list/taxon_list_state.dart';
import 'package:my_catalog/features/taxon/presentation/utils/filter_list_by_name.dart';

class TaxonListCubit extends Cubit<TaxonListState> {
  TaxonListCubit(this._repository, {this.parentKey}) : super(const TaxonListState());

  final ITaxonRepository _repository;
  final int? parentKey;

  Future<void> load() async {
    final items = parentKey == null
        ? await _repository.getTaxons()
        : await _repository.getChildren(parentKey!);
    if (isClosed) return;
    emit(state.copyWith(items: items));
  }

  Future<void> search(String query) async {
  emit(state.copyWith(query: query));

  final base = parentKey == null
      ? await _repository.getTaxons()
      : await _repository.getChildren(parentKey!);

  final items = filterByName(base, query);
  if (isClosed) return;
  emit(state.copyWith(items: items));
  }
}