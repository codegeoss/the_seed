import 'dart:async';
import 'dart:developer';

import 'package:{{project_name.snakeCase()}}/app/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name.snakeCase()}}/bootstrap.dart';
import 'package:{{project_name.snakeCase()}}/core/core.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  await runZonedGuarded(
        () async {
      WidgetsFlutterBinding.ensureInitialized();

      {{project_name.pascalCase()}}Config(
        values: {{project_name.pascalCase()}}Values(
        urlScheme: 'https',
        baseDomain: 'api.example.com',
        hiveBoxKey: '{{project_name.snakeCase()}}_production',
        hiveBoxEncryptionKey: '',
        buildFlavour: BuildFlavour.production,
      ),
      );

      setUpLocator();
      await locator<HiveService>().initBoxes();

      Bloc.observer = AppBlocObserver();

      await GoogleFonts.pendingFonts([
      GoogleFonts.inter,
      ]);

      runApp(
      MultiBlocProvider(
      providers: Singletons.registerCubits(),
      child: const App(),
      ),
      );
    },
        (error, stackTrace) {
      if (kDebugMode) {
        log(error.toString(), stackTrace: stackTrace);
      }
    },
  );
}
