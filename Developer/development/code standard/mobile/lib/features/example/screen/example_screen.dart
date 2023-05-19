import 'package:flutter/material.dart';
import 'package:tooling/features/example/cubit/example_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'example_layout.dart';

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExampleCubit>(
        lazy: false,
        create: (context) => ExampleCubit()..fetchDataFromApi(),
        child: const ExampleLayout());
  }
}
