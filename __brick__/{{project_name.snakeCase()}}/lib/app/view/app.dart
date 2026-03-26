import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/core/core.dart';
import 'package:{{project_name.snakeCase()}}/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      routerConfig: locator<AppRouter>().config(),
    );
  }
}
