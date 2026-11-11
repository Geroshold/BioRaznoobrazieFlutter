import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_catalog/common/network/load_exception.dart';
import 'package:my_catalog/features/taxon/domain/i_taxon_repository.dart';
import 'package:my_catalog/features/taxon/presentation/cubit/detail/taxon_detail_state.dart';

class TaxonDetailCubit extends Cubit<TaxonDetailState> {
  TaxonDetailCubit(this._repository, this.key)
    : super(const TaxonDetailLoading());

  final ITaxonRepository _repository;
  final int key;

  Future<void> load() async {
    emit(const TaxonDetailLoading());

    try {
      final taxon = await _repository.getTaxon(key);
      if (isClosed) return;

      emit(TaxonDetailLoaded(taxon));
    } on NotFoundException {
      if (isClosed) return;
      emit(TaxonDetailNotFound(key));
    } on LoadException catch (error) {
      if (isClosed) return;
      emit(TaxonDetailFailure(key, error));
    }
  }
}
