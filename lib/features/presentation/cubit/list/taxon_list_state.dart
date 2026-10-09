import 'package:my_catalog/features/domain/taxon_model.dart';

final class TaxonListState {
  const TaxonListState({this.items = const[]});

  final List<TaxonModel> items;

  TaxonListState copyWith({List<TaxonModel>? items}) =>
    TaxonListState(items: items ?? this.items);
}