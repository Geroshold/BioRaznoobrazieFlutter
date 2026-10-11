import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_catalog/features/taxon/domain/i_taxon_repository.dart';
import 'package:my_catalog/features/taxon/presentation/cubit/detail/taxon_detail_state.dart';

class TaxonDetailCubit extends Cubit<TaxonDetailState> {
  TaxonDetailCubit(this._repository, this.key)
      : super(const TaxonDetailLoading());

  final ITaxonRepository _repository;
  final int key;

  Future<void> load() async {
    final taxon = await _repository.getTaxon(key);
    if (isClosed) return;

    if (taxon == null) {
      emit(TaxonDetailNotFound(key));
      return;
    }
    emit(TaxonDetailLoaded(taxon));
  }
}