import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_catalog/common/widgets/app_scaffold.dart';
import 'package:my_catalog/features/taxon/presentation/cubit/list/taxon_list_cubit.dart';
import 'package:my_catalog/features/taxon/presentation/cubit/list/taxon_list_state.dart';
import 'package:my_catalog/features/taxon/presentation/view/widgets/taxon_card.dart';
import 'package:my_catalog/features/taxon/presentation/view/widgets/search_field.dart';
import 'package:my_catalog/l10n/app_localizations.dart';

class TaxonListScreen extends StatelessWidget {
  const TaxonListScreen({super.key});

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
                TaxonListLoading() => const Center(child: CircularProgressIndicator()),
                TaxonListLoaded(:final items, :final query) =>
                  items.isEmpty && query.isNotEmpty
                    ? Center(child: Text(l10n.searchEmpty))
                    : ListView.separated(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      itemCount: items.length,
                      itemBuilder: (context, index) => TaxonCard(taxon: items[index]),
                      separatorBuilder: (_, _) => const SizedBox(height: 12),
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}
