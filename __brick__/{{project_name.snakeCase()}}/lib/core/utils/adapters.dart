import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:{{project_name.snakeCase()}}/core/core.dart';

class ThemeAdapter extends TypeAdapter<ThemeMode> {
  @override
  final typeId = 1;

  @override
  ThemeMode read(BinaryReader reader) {
    return ThemeMode.values[reader.readInt()];
  }

  @override
  void write(BinaryWriter writer, ThemeMode obj) {
    writer.writeInt(obj.index);
  }
}
