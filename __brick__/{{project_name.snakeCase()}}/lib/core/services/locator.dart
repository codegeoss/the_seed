import 'package:get_it/get_it.dart';
import 'package:{{project_name.snakeCase()}}/core/core.dart';

final GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerSingleton<NetworkUtil>(NetworkUtil());
}
