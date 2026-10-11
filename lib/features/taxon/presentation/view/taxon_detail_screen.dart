import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_catalog/common/navigation/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_catalog/common/widgets/app_scaffold.dart';
import 'package:my_catalog/features/taxon/domain/taxon_model.dart';
import 'package:my_catalog/features/taxon/presentation/view/widgets/section.dart';
import 'package:my_catalog/features/taxon/domain/i_taxon_repository.dart';
import 'package:my_catalog/features/taxon/presentation/cubit/detail/taxon_detail_cubit.dart';
import 'package:my_catalog/features/taxon/presentation/cubit/detail/taxon_detail_state.dart';
import 'package:my_catalog/features/taxon/presentation/utils/taxon_rank_format.dart';
import 'package:my_catalog/features/taxon/presentation/utils/taxon_format.dart';
import 'package:my_catalog/features/taxon/presentation/view/widgets/rank_chip.dart';
import 'package:my_catalog/features/taxon/presentation/view/widgets/taxon_fact_row.dart';
import 'package:my_catalog/l10n/app_localizations.dart';

class TaxonDetailScreen extends StatelessWidget {
  const TaxonDetailScreen({super.key, required this.taxonKey});

  final int taxonKey;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaxonDetailCubit(
        context.read<ITaxonRepository>(),
        taxonKey,
      )..load(),
      child: AppScaffold(
        body: BlocBuilder<TaxonDetailCubit, TaxonDetailState>(
          builder: (context, state) => switch (state) {
            TaxonDetailLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            TaxonDetailNotFound() => Center(
              child: Text(AppLocalizations.of(context).detailNotFound),
            ),
            TaxonDetailLoaded(:final taxon) =>
              _DetailContent(taxon: taxon),
          },
        ),
      ),
    );
  }
}

class _DetailContent extends StatelessWidget {
  const _DetailContent({required this.taxon});

  final TaxonModel taxon;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final locale = Localizations.localeOf(context).toString();
    final hasChildren = taxon.numDescendants > 0;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.taxonNumber(taxon.displayNumber),
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 6),

              Text(taxon.displayName, style: theme.textTheme.headlineMedium),
              const SizedBox(height: 6),

              RankChip(
                label: taxon.rank.label(l10n),
                color: taxon.rank.color,
              ),

              const SizedBox(height: 16),
              TaxonFactRow(
                label: l10n.detailCanonicalName,
                value: taxon.displayCanonicalName!,
              ),

              const SizedBox(height: 8),
              TaxonFactRow(
                label: l10n.detailDescendants,
                value: formatNumDescendants(taxon.numDescendants, locale),
              ),

              if (taxon.description != null) ...[
                Section(title: l10n.sectionDescription),
                Text(
                  taxon.description!,
                  style: theme.textTheme.bodyLarge,
                ),
              ],

              if (hasChildren) ...[
                const SizedBox(height: 24),
                Center(
                  child: FilledButton(
                    onPressed: () => context.push(AppRoutes.children(taxon.key)),
                    child: Text(l10n.sectionChildren),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}