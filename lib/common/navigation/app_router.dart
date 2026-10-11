import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_catalog/common/widgets/app_scaffold.dart';
import 'package:my_catalog/features/taxon/presentation/view/taxon_children_screen.dart';
import 'package:my_catalog/features/taxon/presentation/view/taxon_detail_screen.dart';
import 'package:my_catalog/features/taxon/presentation/view/taxon_list_screen.dart';
import 'package:my_catalog/l10n/app_localizations.dart';

abstract final class AppRoutes {
  static const String list = '/';
  static String detail(int key) => '/taxon/$key';
  static String children(int parentKey) => '/taxon/$parentKey/children';
}

abstract final class AppRouter {
  
  static const Duration _transition = Duration(milliseconds: 300);

  static final GoRouter router = _create();

  static GoRouter _create() {
    GoRouter.optionURLReflectsImperativeAPIs = true;
    return GoRouter(
      initialLocation: AppRoutes.list,
      routes: [
        GoRoute(
          path: AppRoutes.list,
          pageBuilder: (context, state) =>
              _page(state, const TaxonListScreen()),
          routes: [
            GoRoute(
              path: 'taxon/:key',
              pageBuilder: (context, state) {
                final key = int.tryParse(state.pathParameters['key']!);
                return _page(
                  state,
                  key == null
                      ? const _NotFoundScreen()
                      : TaxonDetailScreen(taxonKey: key),
                );
              },
              routes: [
                GoRoute(
                  path: 'children',
                  pageBuilder: (context, state) {
                    final key = int.tryParse(state.pathParameters['key']!);
                    return _page(
                      state,
                      key == null
                          ? const _NotFoundScreen()
                          : TaxonChildrenScreen(parentKey: key),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
      errorBuilder: (context, state) => const _NotFoundScreen(),
    );
  }

  static Page<void> _page(GoRouterState state, Widget child) {
    return CustomTransitionPage(
      key: state.pageKey,
      transitionDuration: _transition,
      reverseTransitionDuration: _transition,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curved = animation.drive(CurveTween(curve: Curves.easeOutCubic));
        return SlideTransition(
          position: Tween(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(curved),
          child: SlideTransition(
            position: Tween(
              begin: Offset.zero,
              end: const Offset(-0.3, 0),
            ).animate(secondaryAnimation),
            child: FadeTransition(opacity: curved, child: child),
          ),
        );
      },
    );
  }
}

class _NotFoundScreen extends StatelessWidget {
  const _NotFoundScreen();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Center(child: Text(AppLocalizations.of(context).pageNotFound)),
    );
  }
}