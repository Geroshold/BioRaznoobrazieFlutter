import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_catalog/common/locale/locale_cubit.dart';
import 'package:my_catalog/common/navigation/app_router.dart';
import 'package:my_catalog/common/theme/app_theme.dart';
import 'package:my_catalog/common/theme/theme_cubit.dart';
import 'package:my_catalog/features/taxon/data/taxon_repository.dart';
import 'package:my_catalog/features/taxon/domain/i_taxon_repository.dart';
import 'package:my_catalog/features/taxon/presentation/cubit/list/taxon_list_cubit.dart';
import 'package:my_catalog/l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

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
          BlocProvider(create: (_) => ThemeCubit()),
          BlocProvider(
            create: (_) => LocaleCubit(
              AppLocalizations.supportedLocales.toList(),
              system: PlatformDispatcher.instance.locale,
            ),
          ),
        ],
        child: BlocBuilder<LocaleCubit, Locale>(
          builder: (context, locale) => BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) => MaterialApp.router(
              routerConfig: AppRouter.router,
              onGenerateTitle: (context) =>
                  AppLocalizations.of(context).appTitle,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              themeMode: themeMode,
              locale: locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
            ),
          ),
        ),
      ),
    );
  }
}
