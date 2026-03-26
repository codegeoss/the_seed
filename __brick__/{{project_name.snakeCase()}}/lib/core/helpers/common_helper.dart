import 'package:{{project_name.snakeCase()}}/versioning/build_version.dart';

abstract class CommonHelper {
  static String getAppVersion() => packageVersion;
}
