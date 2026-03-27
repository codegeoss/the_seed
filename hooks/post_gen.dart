import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  /// Below are all the actions performed after the template has been generated.
  ///
  /// This post-generation hook (`post_gen.dart`) is used to perform tasks that
  /// require the generated files to be present on the file system.
  ///
  /// Common tasks include:
  ///
  /// * Installing dependencies (`flutter pub get`)
  /// * Running code generation (`build_runner`)
  /// * Initializing a git repository
  /// * Formatting the generated code
  ///
  /// By design, Mason generates the files first, then executes this hook.
  /// Since "The Seed" creates a nested folder based on `project_name`,
  /// we must ensure commands are run within that specific directory.

  final projectName = context.vars['project_name'] as String;
  final projectDirectory = Directory('${Directory.current.path}/$projectName');

  // Check if the directory exists to avoid crashes
  if (!projectDirectory.existsSync()) {
    context.logger.err(
      'Could not find project directory at ${projectDirectory.path}',
    );
    return;
  }

  /// 1. Install Dependencies
  ///
  /// This is equivalent to running `flutter pub get` in the terminal.
  /// It ensures the project is ready to be opened in an IDE immediately.
  final pubGetProgress = context.logger.progress(
    'Sowing the Seed: Installing dependencies',
  );
  try {
    await Process.run(
      'flutter',
      ['pub', 'get'],
      workingDirectory: projectDirectory.path,
    );
    pubGetProgress.complete('Dependencies installed!');
  } on Exception catch (e) {
    pubGetProgress.fail('Failed to install dependencies: $e');
  }

  /// 2. Run Build Runner
  ///
  /// Since "The Seed" includes dependencies like Freezed and Hive,
  /// we run `build_runner` to generate the necessary boilerplate code.
  final buildRunnerProgress = context.logger.progress(
    'Sowing the Seed: Generating code (build_runner)',
  );
  try {
    await Process.run(
      'dart',
      ['run', 'build_runner', 'build', '--delete-conflicting-outputs'],
      workingDirectory: projectDirectory.path,
    );
    buildRunnerProgress.complete('Code generation complete!');
  } on Exception catch (e) {
    buildRunnerProgress.fail('Failed to run build_runner: $e');
  }

  /// 3. Fix Analyzer Issues
  ///
  /// This runs `dart fix --apply`. It automatically resolves fixable
  /// lint errors (like unused imports or deprecated members) that
  /// might have been introduced during the template generation.
  final fixProgress = context.logger.progress(
    'Sowing the Seed: Fixing analyzer issues',
  );
  try {
    await Process.run(
      'dart',
      ['fix', '--apply'],
      workingDirectory: projectDirectory.path,
    );
    fixProgress.complete('Analyzer issues fixed!');
  } on Exception catch (e) {
    fixProgress.fail('Failed to run dart fix: $e');
  }

  /// 4. Format Code
  ///
  /// This runs `dart format lib test`. It specifically targets your
  /// source and test directories to ensure the code looks professional.
  final formatProgress = context.logger.progress(
    'Sowing the Seed: Formatting code',
  );
  try {
    await Process.run(
      'dart',
      ['format', 'lib', 'test'],
      workingDirectory: projectDirectory.path,
    );
    formatProgress.complete('Code formatted!');
  } on Exception catch (e) {
    formatProgress.fail('Failed to format code: $e');
  }

  /// Final Summary
  ///
  /// Provide the user with clear next steps to start their new world.
  context.logger.info('\n');
  context.logger.info(lightGreen.wrap('✨ The Seed has sprouted successfully!'));
  context.logger.info('\nNext steps:');
  context.logger.info(cyan.wrap('  cd $projectName'));
  context.logger.info(cyan.wrap('  flutter run'));
  context.logger.info('\n');
}
