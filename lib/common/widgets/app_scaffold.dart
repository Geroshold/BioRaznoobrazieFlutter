import 'package:flutter/material.dart';
import 'package:my_catalog/common/widgets/locale_toggle_button.dart';
import 'package:my_catalog/common/widgets/theme_toggle_button.dart';
import 'package:my_catalog/l10n/app_localizations.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.body, this.actions = const []});

  final Widget body;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).appTitle),
        actions: [...actions, 
        const LocaleToggleButton(),
        const ThemeToggleButton(),],
      ),
      body: body,
    );
  }
}