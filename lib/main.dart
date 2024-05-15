import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'config/theme/theme.dart';
import 'pages/main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: buildThemeData(context: context),
      dark: buildThemeData(context: context, isDarkTheme: true),
      initial: AdaptiveThemeMode.light,
      builder: (ThemeData theme, ThemeData darkTheme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Responsive UI',
          theme: theme,
          darkTheme: darkTheme,
          builder: (context, child) => ResponsiveBreakpoints.builder(
            breakpoints: [
              const Breakpoint(start: 0, end: 360, name: 'SMALL_MOBILE'),
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
            child: child!,
          ),
          initialRoute: '/',
          onGenerateRoute: (RouteSettings settings) {
            return MaterialPageRoute(
              builder: (context) {
                return BouncingScrollWrapper.builder(
                  context,
                  buildPage(name: settings.name ?? '', context: context),
                  dragWithMouse: true,
                );
              },
            );
          },
        );
      },
    );
  }

  Widget buildPage({
    required String name,
    required BuildContext context,
  }) {
    switch (name) {
      case "/":
        if (ResponsiveBreakpoints.of(context).largerThan(MOBILE)) {
          debugPrint(
            "largerThanTabLayout: ${ResponsiveBreakpoints.of(context).largerThan(MOBILE)}",
          );

          return const MainPage();

          // return Container(
          //   decoration: const BoxDecoration(
          //     color: Colors.cyanAccent,
          //   ),
          //   child: const Text("Tab Layout"),
          // );
        } else if (ResponsiveBreakpoints.of(context).largerThan(TABLET)) {
          debugPrint(
            "largerThanWebLayout: ${ResponsiveBreakpoints.of(context).largerThan(TABLET)}",
          );
          // return Container(
          //   decoration: const BoxDecoration(
          //     color: Colors.cyanAccent,
          //   ),
          //   child: const Text("Web Layout"),
          // );
          return const MainPage();
        } else {
          debugPrint(
            "largerThanMobileLayout",
          );
          // return Container(
          //   decoration: const BoxDecoration(
          //     color: Colors.cyanAccent,
          //   ),
          //   child: const Text("Mobile Layout"),
          // );
          return const MainPage();
        }
      default:
        return const SizedBox.shrink();
    }
  }
}
