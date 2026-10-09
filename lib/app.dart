import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_catalog/features/data/taxon_repository.dart';
import 'package:my_catalog/features/domain/i_taxon_repository.dart';
import 'package:my_catalog/features/presentation/cubit/list/taxon_list_cubit.dart';
import 'package:my_catalog/features/presentation/view/taxon_list_screen.dart';
import 'package:my_catalog/l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key, this.locale});

  final Locale? locale;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ITaxonRepository>(
          create: (_) => const TaxonRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                TaxonListCubit(context.read<ITaxonRepository>())..load(),
          ),
        ],
        child: MaterialApp(
          onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Roboto'),
          locale: locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const TaxonListScreen(),
        ),
      ),
    );
  }
}