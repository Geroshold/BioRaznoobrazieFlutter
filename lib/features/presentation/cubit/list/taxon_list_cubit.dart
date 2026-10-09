import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_catalog/features/domain/i_taxon_repository.dart';
import 'package:my_catalog/features/presentation/cubit/list/taxon_list_state.dart';

class TaxonListCubit extends Cubit<TaxonListState> {
  TaxonListCubit(this._repository) : super(const TaxonListState());

  final ITaxonRepository _repository;

  Future<void> load() async {
    final items = await _repository.getTaxons();
    if (isClosed) return;
    emit(state.copyWith(items: items));
  }
}