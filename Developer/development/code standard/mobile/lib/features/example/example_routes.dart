import 'package:flutter/material.dart';
import 'package:tooling/features/example/screen/example_screen.dart';

Map<String, Widget Function(BuildContext)> exampleRoutes = {
  "/example": (context) {
    // final args =
    //     ModalRoute.of(context)!.settings.arguments as AnimeListArguments;
    return const ExampleScreen();
  },
};

// class ExampleArguments {
//   ExampleArguments();
// }
