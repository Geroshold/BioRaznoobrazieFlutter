import 'package:my_catalog/features/taxon/domain/taxon_model.dart';

final class TaxonListState {
  const TaxonListState({this.query = '', this.items = const[]});

  final String query;
  final List<TaxonModel> items;

  TaxonListState copyWith({String? query, List<TaxonModel>? items}) =>
      TaxonListState(query: query ?? this.query, items: items ?? this.items);
}