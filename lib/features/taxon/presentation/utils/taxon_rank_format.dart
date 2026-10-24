import 'package:flutter/material.dart';
import 'package:my_catalog/common/theme/app_colors.dart';
import 'package:my_catalog/features/taxon/domain/taxon_rank.dart';
import 'package:my_catalog/l10n/app_localizations.dart';

extension TaxonRankFormat on TaxonRank {
  String label(AppLocalizations l10n) => switch (this) {
    TaxonRank.kingdom => l10n.rankKingdom,
    TaxonRank.phylum  => l10n.rankPhylum,
    TaxonRank.klass   => l10n.rankClass,
    TaxonRank.order   => l10n.rankOrder,
    TaxonRank.family  => l10n.rankFamily,
    TaxonRank.genus   => l10n.rankGenus,
    TaxonRank.species => l10n.rankSpecies,
  };
  
  Color get color => switch (this) {
    TaxonRank.kingdom => AppColors.rankKingdomBg,
    TaxonRank.phylum  => AppColors.rankPhylumBg,
    TaxonRank.klass   => AppColors.rankKlassBg,
    TaxonRank.order   => AppColors.rankOrderBg,
    TaxonRank.family  => AppColors.rankFamilyBg,
    TaxonRank.genus   => AppColors.rankGenusBg,
    TaxonRank.species => AppColors.rankSpeciesBg
  };

  Color get onColor => switch (this) {
    TaxonRank.kingdom => AppColors.rankKingdomFg,
    TaxonRank.phylum  => AppColors.rankPhylumFg,
    TaxonRank.klass   => AppColors.rankKlassFg,
    TaxonRank.order   => AppColors.rankOrderFg,
    TaxonRank.family  => AppColors.rankFamilyFg,
    TaxonRank.genus   => AppColors.rankGenusFg,
    TaxonRank.species => AppColors.rankSpeciesFg,
  };
}
