import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:{{project_name.snakeCase()}}/core/core.dart';

abstract class HiveService {
  Future<void> initBoxes();
  void persistToken(String token);
  String? retrieveToken();
  void deleteToken();
  void persistThemeMode(ThemeMode themeMode);
  ThemeMode retrieveThemeMode();
  void clearBox();
}

class HiveServiceImplementation implements HiveService {
  @override
  Future<void> initBoxes() async {
    await Hive.initFlutter();

    const secureStorage = FlutterSecureStorage();
    final encryptionKeyString = await secureStorage.read(
      key: {{project_name.pascalCase()}}Config.instance!.values.hiveBoxEncryptionKey,
    );
    if (encryptionKeyString == null) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(
        key: {{project_name.pascalCase()}}Config.instance!.values.hiveBoxEncryptionKey,
        value: base64UrlEncode(key),
      );
    }
    final key = await secureStorage.read(
      key: {{project_name.pascalCase()}}Config.instance!.values.hiveBoxEncryptionKey,
    );
    final encryptionKeyUint8List = base64Url.decode(key!);

    Hive.registerAdapter(ThemeAdapter());

    await Hive.openBox<dynamic>(
      {{project_name.pascalCase()}}Config.instance!.values.hiveBoxKey,
      encryptionCipher: HiveAesCipher(encryptionKeyUint8List),
    );
  }

  @override
  void clearBox() {
    Hive.box<dynamic>(
      {{project_name.pascalCase()}}Config.instance!.values.hiveBoxKey,
    ).deleteAll(['accessToken']);
  }

  @override
  void persistToken(String token) {
    Hive.box<dynamic>(
      {{project_name.pascalCase()}}Config.instance!.values.hiveBoxKey,
    ).put('accessToken', token);
  }

  @override
  String? retrieveToken() {
    final box = Hive.box<dynamic>({{project_name.pascalCase()}}Config.instance!.values.hiveBoxKey);
    final accessToken = box.get('accessToken') as String?;
    if (accessToken == null) return null;
    return accessToken;
  }

  @override
  void deleteToken() {
    Hive.box<dynamic>(
      {{project_name.pascalCase()}}Config.instance!.values.hiveBoxKey,
    ).delete('accessToken');
  }

  @override
  void persistThemeMode(ThemeMode themeMode) {
    Hive.box<dynamic>(
      {{project_name.pascalCase()}}Config.instance!.values.hiveBoxKey,
    ).put('themeMode', themeMode.toString());
  }

  @override
  ThemeMode retrieveThemeMode() {
    final themeMode =
        Hive.box<dynamic>(
              {{project_name.pascalCase()}}Config.instance!.values.hiveBoxKey,
            ).get('themeMode')
            as String?;

    return ThemeMode.values.firstWhere(
      (element) => element.toString() == themeMode,
      orElse: () => ThemeMode.light,
    );
  }
}
