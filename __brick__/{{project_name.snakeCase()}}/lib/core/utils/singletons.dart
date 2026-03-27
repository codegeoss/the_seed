import 'package:flutter_bloc/flutter_bloc.dart';

class Singletons {
  static List<BlocProvider> registerCubits() => [
    BlocProvider(create: (context) => CounterCubit()),
  ];
}
