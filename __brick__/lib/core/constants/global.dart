import 'package:flutter/foundation.dart';
import 'package:{{project_name.snakeCase()}}/core/core.dart';

class {{project_name.pascalCase()}}Values {
  {{project_name.pascalCase()}}Values({
    required this.urlScheme,
    required this.baseDomain,
    required this.hiveBoxKey,
    required this.hiveBoxEncryptionKey,
    required this.buildFlavour,
  });

  final String urlScheme;
  final String baseDomain;
  final String hiveBoxKey;
  final String hiveBoxEncryptionKey;

  final BuildFlavour buildFlavour;

  String get baseUrl => '$urlScheme://$baseDomain/api';

  Duration get backgroundTimeOut =>
      kReleaseMode ? const Duration(minutes: 1) : const Duration(minutes: 30);

  Duration get foregroundTimeOut =>
      kReleaseMode ? const Duration(minutes: 3) : const Duration(minutes: 30);
}

class {{project_name.pascalCase()}}Config {
  factory TiifuConfig({required {{project_name.pascalCase()}}Values values}) {
    return _instance ??= {{project_name.pascalCase()}}Config._internal(values);
  }

  {{project_name.pascalCase()}}Config._internal(this.values);

  final {{project_name.pascalCase()}}Values values;
  static {{project_name.pascalCase()}}Config? _instance;

  static {{project_name.pascalCase()}}Config? get instance => _instance;
}
