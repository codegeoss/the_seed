import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name.snakeCase()}}/features/features.dart';

class Singletons {
  static List<BlocProvider> registerCubits() => [
    BlocProvider<CounterCubit>(create: (context) => CounterCubit()),
  ];
}
