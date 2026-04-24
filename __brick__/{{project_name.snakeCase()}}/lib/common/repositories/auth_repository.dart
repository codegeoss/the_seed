import 'package:{{project_name.snakeCase()}}/core/core.dart';

abstract class AuthRepository {}

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required NetworkUtil networkUtil})
    : _networkUtil = networkUtil;
  late final NetworkUtil _networkUtil;
}
