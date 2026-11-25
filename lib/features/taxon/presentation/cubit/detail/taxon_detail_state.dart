import 'package:my_catalog/common/network/load_exception.dart';
import 'package:my_catalog/features/taxon/domain/taxon_model.dart';

sealed class TaxonDetailState {
  const TaxonDetailState();
}

final class TaxonDetailLoading extends TaxonDetailState {
  const TaxonDetailLoading();
}

final class TaxonDetailLoaded extends TaxonDetailState {
  const TaxonDetailLoaded(this.taxon);
  final TaxonModel taxon;
}

final class TaxonDetailNotFound extends TaxonDetailState {
  const TaxonDetailNotFound(this.key);

  final int key;
}

final class TaxonDetailFailure extends TaxonDetailState {
  const TaxonDetailFailure(this.key, this.error);

  final int key;
  final LoadException error;
}
