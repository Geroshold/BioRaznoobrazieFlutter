import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_catalog/common/navigation/app_router.dart';
import 'package:my_catalog/features/taxon/domain/taxon_model.dart';
import 'package:my_catalog/features/taxon/presentation/utils/taxon_format.dart';
import 'package:my_catalog/features/taxon/presentation/view/widgets/card_surface.dart';
import 'package:my_catalog/features/taxon/presentation/view/widgets/rank_chip.dart';
import 'package:my_catalog/features/taxon/presentation/view/widgets/taxon_placeholder.dart';
import 'package:my_catalog/features/taxon/presentation/utils/taxon_rank_format.dart';
import 'package:my_catalog/l10n/app_localizations.dart';

class TaxonCard extends StatelessWidget {
  const TaxonCard({super.key, required this.taxon});

  final TaxonModel taxon;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return CardSurface(
      onTap: () => context.push(AppRoutes.detail(taxon.key)),
      child: Row(
        children: [
          TaxonPlaceholder(name: taxon.displayName, color: taxon.rank.color),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.taxonNumber(taxon.displayNumber),
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 6),
              Text(taxon.displayName, style: theme.textTheme.titleMedium),
              const SizedBox(height: 6),
              RankChip(label: taxon.rank.label(l10n), color: taxon.rank.color,),
            ],
          ),
        ),
        ],
      )
    );
  }
}
