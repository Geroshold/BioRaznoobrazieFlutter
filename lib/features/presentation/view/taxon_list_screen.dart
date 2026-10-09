import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_catalog/common/widgets/app_scaffold.dart';
import 'package:my_catalog/features/presentation/cubit/list/taxon_list_cubit.dart';
import 'package:my_catalog/features/presentation/cubit/list/taxon_list_state.dart';
import 'package:my_catalog/features/presentation/view/widgets/taxon_card.dart';

class TaxonListScreen extends StatelessWidget {
  const TaxonListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: BlocBuilder<TaxonListCubit, TaxonListState>(
        builder: (context, state) => ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: state.items.length,
          separatorBuilder: (_, _) => const SizedBox(height: 12),
          itemBuilder: (context, index) =>
              TaxonCard(taxon: state.items[index]),
        ),
      ),
    );
  }
}