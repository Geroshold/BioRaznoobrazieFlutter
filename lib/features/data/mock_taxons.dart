import 'package:my_catalog/features/domain/taxon_model.dart';
import 'package:my_catalog/features/domain/taxon_rank.dart';

const List<TaxonModel> mockTaxons = [
  TaxonModel(
    key: 0,
    scientificName: "incertae sedis",
    canonicalName: "incertae sedis",
    rank: TaxonRank.kingdom,
    parentKey: null,
    numDescendants: 3613,
    kingdom: "incertae sedis",
    phylum: null,
    description: null,
  ),
  TaxonModel(
    key: 1,
    scientificName: "Animalia",
    canonicalName: "Animalia",
    rank: TaxonRank.kingdom,
    parentKey: null,
    numDescendants: 2981931,
    kingdom: "Animalia",
    phylum: null,
    description: 'Key to Chalcovietnamicus species groups and species 1. Embolus screw-like, without large embolic disc (ED) hidden between palpal bulb and cymbium; retromargin of chelicerae with one large fissidentate tooth of four cusps (Logunov 2020: figs 5-6).'
  ),
TaxonModel(
    key: 2,
    scientificName: "Archaea",
    canonicalName: "Archaea",
    rank: TaxonRank.kingdom,
    parentKey: null,
    numDescendants: 4358,
    kingdom: "Archaea",
    phylum: null,
    description: null
  ),
  TaxonModel(
    key: 3,
    scientificName: "Bacteria",
    canonicalName: "Bacteria",
    rank: TaxonRank.kingdom,
    parentKey: null,
    numDescendants: 67224,
    kingdom: "Bacteria",
    phylum: null,
    description: null
  ),
  TaxonModel(
    key: 4,
    scientificName: "Chromista",
    canonicalName: "Chromista",
    rank: TaxonRank.kingdom,
    parentKey: null,
    numDescendants: 163420,
    kingdom: "Chromista",
    phylum: null,
    description: null
  ),
  TaxonModel(
    key: 5,
    scientificName: "Fungi",
    canonicalName: "Fungi",
    rank: TaxonRank.kingdom,
    parentKey: null,
    numDescendants: 486142,
    kingdom: "Fungi",
    phylum: null,
    description: 'Description. As in Moore (1980).'
  ),
  TaxonModel(
    key: 6,
    scientificName: "Plantae",
    canonicalName: "Plantae",
    rank: TaxonRank.kingdom,
    parentKey: null,
    numDescendants: 716896,
    kingdom: "Plantae",
    phylum: null,
    description: "41 (54). Carex montana L., Sp. Pl.: 975 (1753)."
  ),
  TaxonModel(
    key: 7,
    scientificName: "Protozoa",
    canonicalName: "Protozoa",
    rank: TaxonRank.kingdom,
    parentKey: null,
    numDescendants: 9113,
    kingdom: "Protozoa",
    phylum: null,
    description: null
  ),
  TaxonModel(
    key: 8,
    scientificName: "Viruses",
    canonicalName: "Viruses",
    rank: TaxonRank.kingdom,
    parentKey: null,
    numDescendants: 19564,
    kingdom: "Viruses",
    phylum: null,
    description: null
  ),
  TaxonModel(
    key: 9,
    scientificName: "Marchantiophyta",
    canonicalName: "Marchantiophyta",
    rank: TaxonRank.phylum,
    parentKey: 6,
    numDescendants: 12141,
    kingdom: "Plantae",
    phylum: "Marchantiophyta",
    description: null
  ),
  TaxonModel(
    key: 11,
    scientificName: "Ginkgophyta",
    canonicalName: "Ginkgophyta",
    rank: TaxonRank.phylum,
    parentKey: 6,
    numDescendants: 0,
    kingdom: "Plantae",
    phylum: "Ginkgophyta",
    description: null
  ),
  TaxonModel(
    key: 12,
    scientificName: "Lycopodiophyta",
    canonicalName: "Lycopodiophyta",
    rank: TaxonRank.phylum,
    parentKey: 6,
    numDescendants: 0,
    kingdom: "Plantae",
    phylum: "Lycopodiophyta",
    description: null
  ),
  TaxonModel(
    key: 13,
    scientificName: "Anthocerotophyta",
    canonicalName: "Anthocerotophyta",
    rank: TaxonRank.phylum,
    parentKey: 6,
    numDescendants: 370,
    kingdom: "Plantae",
    phylum: "Anthocerotophyta",
    description: null
  ),
  TaxonModel(
    key: 14,
    scientificName: "Tardigrada",
    canonicalName: "Tardigrada",
    rank: TaxonRank.phylum,
    parentKey: 1,
    numDescendants: 2280,
    kingdom: "Animalia",
    phylum: "Tardigrada",
    description: "Tardigrada Bathyechiniscus craticulus Pollock, 1983; re-described and new combination as Styraconyx craticulus (Pollock, 1983) in Kristensen & Higgins (1984a)."
  ),
  TaxonModel(
    key: 17,
    scientificName: "Neocallimastigomycota",
    canonicalName: "Neocallimastigomycota",
    rank: TaxonRank.phylum,
    parentKey: 5,
    numDescendants: 262,
    kingdom: "Fungi",
    phylum: "Neocallimastigomycota",
    description: "Description. As in Hibbett et al. (2007)."
  ),
  TaxonModel(
    key: 18,
    scientificName: "Glomeromycota",
    canonicalName: "Glomeromycota",
    rank: TaxonRank.phylum,
    parentKey: 5,
    numDescendants: 8540,
    kingdom: "Fungi",
    phylum: "Glomeromycota",
    description: null
  ),
  TaxonModel(
    key: 19,
    scientificName: "Phoronida",
    canonicalName: "Phoronida",
    rank: TaxonRank.phylum,
    parentKey: 1,
    numDescendants: 56,
    kingdom: "Animalia",
    phylum: "Phoronida",
    description: null
  ),
  TaxonModel(
    key: 22,
    scientificName: "Gastrotricha",
    canonicalName: "Gastrotricha",
    rank: TaxonRank.phylum,
    parentKey: 1,
    numDescendants: 1265,
    kingdom: "Animalia",
    phylum: "Gastrotricha",
    description: null
  ),
  TaxonModel(
    key: 25,
    scientificName: "Acidobacteria",
    canonicalName: "Acidobacteria",
    rank: TaxonRank.phylum,
    parentKey: 3,
    numDescendants: 0,
    kingdom: "Bacteria",
    phylum: "Acidobacteria",
    description: null
  ),
  TaxonModel(
    key: 26,
    scientificName: "Actinobacteria",
    canonicalName: "Actinobacteria",
    rank: TaxonRank.phylum,
    parentKey: 3,
    numDescendants: 0,
    kingdom: "Bacteria",
    phylum: "Actinobacteria",
    description: null
  )
];