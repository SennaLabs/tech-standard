import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tooling/config/app_routes.dart';
import 'package:tooling/core/blocs/user_bloc/user_bloc.dart';
import 'package:tooling/core/services/graph_ql/gql_service.dart';
import 'package:tooling/core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const AppInit());
}

/// Setting Service, Config and Provider/BLOC here :>
class AppInit extends StatelessWidget {
  const AppInit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GQLService.instance.client,
      child: CacheProvider(
        child: EasyLocalization(
          path: 'assets/locale',
          supportedLocales: const [Locale('en'), Locale('th')],
          startLocale: const Locale('th'),
          fallbackLocale: const Locale('th'),
          useFallbackTranslations: true,
          child: MultiBlocProvider(
            // Set up a provider, that's public type only, here.
            providers: [
              BlocProvider(
                lazy: false,
                create: (context) => UserBloc(),
              ),
            ],
            child: const MyApp(),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Senna Labs Tech standard",
      initialRoute: '/',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      navigatorKey: navigatorKey,
      routes: appRoutes,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.white,
        primaryColor: const Color(0xFF3f54d9),
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: AppTheme.font.sarabunS14,
          bodyMedium: AppTheme.font.mitrS14,
        ),
        checkboxTheme: CheckboxThemeData(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          fillColor: MaterialStateProperty.resolveWith((state) {
            if (state.contains(MaterialState.selected)) {
              return AppTheme.color.priHexColor;
            } else {
              return AppTheme.color.borderColor;
            }
          }),
        ),
        scrollbarTheme: ScrollbarThemeData(
          crossAxisMargin: 2,
          mainAxisMargin: 0,
          minThumbLength: 20,
          thickness: MaterialStateProperty.all(6),
          thumbVisibility: MaterialStateProperty.all(true),
          thumbColor: MaterialStateProperty.all(AppTheme.color.primaryBlueGrayColor),
          radius: const Radius.circular(5),
          trackColor: MaterialStateProperty.all(AppTheme.color.secondaryBlueGrayColor),
          trackVisibility: MaterialStateProperty.all(true),
          trackBorderColor: MaterialStateProperty.all(Colors.transparent),
          interactive: true,
        ),
        colorScheme: ColorScheme.light(
          primary: const Color(0xFF3F54D9),
          secondary: const Color(0xFF3F54D9).withOpacity(.6),
          primaryContainer: const Color(0xFFffffff),
          background: const Color(0xff0c1135),
        ),
      ),
    );
  }
}
