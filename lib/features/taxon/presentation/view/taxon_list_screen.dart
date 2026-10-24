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
              builder: (context, state) {
                if (state.items.isEmpty && state.query.isNotEmpty) {
                  return Center(child: Text(l10n.searchEmpty));
                }
                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.items.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 12),
                  itemBuilder: (context, index) =>
                      TaxonCard(taxon: state.items[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
