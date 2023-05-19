import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tooling/features/example/example_routes.dart';
import 'package:tooling/features/example/screen/example_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const AppBloc());
}

/// Setting BLOC here :>
class AppBloc extends StatelessWidget {
  const AppBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return MultiBlocProvider(
    //   providers: [
    //     /// Add bloc provider here
    //     BlocProvider<ExampleBloc>(
    //       create: (context) => ExampleBloc(),
    //     ),
    //   ],
    //   child: const AppRouter(),
    // );

    return const AppRouter();
  }
}

class AppRouter extends StatelessWidget {
  const AppRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      navigatorKey: navigatorKey,

      /// Example Navigator.pushNamed( context, '/' );
      routes: {
        '/': (context) => const ExampleScreen(),
        ...exampleRoutes,
      },
    );
  }
}
