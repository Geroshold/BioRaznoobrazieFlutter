import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_catalog/common/widgets/app_scaffold.dart';
import 'package:my_catalog/common/widgets/load_error_view.dart';
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
    final cubit = context.read<TaxonListCubit>();
    
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
                TaxonListFailure(:final error) => Center(
                  child: LoadErrorView(
                    error: error,
                    onRetry: cubit.load,
                  ),
                ),
                TaxonListLoaded(:final items) when items.isEmpty => Center(
                  child: Text(l10n.searchEmpty),
                ),
                TaxonListLoaded() => _TaxonList(state: state),
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _TaxonList extends StatefulWidget {
  const _TaxonList({required this.state});

  final TaxonListLoaded state;

  @override
  State<_TaxonList> createState() => _TaxonListState();
}

class _TaxonListState extends State<_TaxonList> {
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_controller.position.extentAfter < 240) {
      context.read<TaxonListCubit>().fetchNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    final showFooter = state.isLoadingMore;

    return ListView.separated(
      controller: _controller,
      padding: const EdgeInsets.all(16),
      itemCount: state.items.length + (showFooter ? 1 : 0),
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        if (index >= state.items.length) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return TaxonCard(taxon: state.items[index]);
      },
    );
  }
}
