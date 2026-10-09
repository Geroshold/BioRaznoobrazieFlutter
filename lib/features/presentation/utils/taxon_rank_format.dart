import 'package:flutter/material.dart';
import 'package:my_catalog/common/theme/app_colors.dart';
import 'package:my_catalog/features/domain/taxon_rank.dart';
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
    TaxonRank.kingdom => AppColors.typeKingdom,
    TaxonRank.phylum => AppColors.typePhylum,
    TaxonRank.klass => AppColors.typeKlass,
    TaxonRank.order => AppColors.typeOrder,
    TaxonRank.family => AppColors.typeFamily,
    TaxonRank.genus => AppColors.typeGenus,
    TaxonRank.species => AppColors.typeSpecies
  };
}