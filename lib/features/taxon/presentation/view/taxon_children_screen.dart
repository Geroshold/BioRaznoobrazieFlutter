import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_catalog/common/widgets/app_scaffold.dart';
import 'package:my_catalog/features/taxon/domain/i_taxon_repository.dart';
import 'package:my_catalog/features/taxon/presentation/cubit/list/taxon_list_cubit.dart';
import 'package:my_catalog/features/taxon/presentation/cubit/list/taxon_list_state.dart';
import 'package:my_catalog/features/taxon/presentation/view/widgets/taxon_card.dart';
import 'package:my_catalog/features/taxon/presentation/view/widgets/search_field.dart';
import 'package:my_catalog/l10n/app_localizations.dart';

class TaxonChildrenScreen extends StatelessWidget {
  const TaxonChildrenScreen({super.key, required this.parentKey});

  final int parentKey;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TaxonListCubit(
        context.read<ITaxonRepository>(),
        parentKey: parentKey,
      )..load(),
      child: const _TaxonChildrenBody(),
    );
  }
}

class _TaxonChildrenBody extends StatelessWidget {
  const _TaxonChildrenBody();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppScaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: SearchField(
              onChanged: context.read<TaxonListCubit>().search,
            ),
          ),
          Expanded(
            child: BlocBuilder<TaxonListCubit, TaxonListState>(
              builder: (context, state) => switch(state) {
                TaxonListLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),
                TaxonListLoaded(:final items, :final query) =>
                  items.isEmpty && query.isNotEmpty
                    ? Center(child: Text(l10n.searchEmpty))
                    : items.isEmpty
                      ? Center(child: Text(l10n.childrenEmpty))
                      : ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemCount: items.length,               
                        separatorBuilder: (_, _) => const SizedBox(height: 12),
                        itemBuilder: (context, index) =>
                          TaxonCard(taxon: items[index]),
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}
