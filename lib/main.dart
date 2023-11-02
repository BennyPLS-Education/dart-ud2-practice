import 'package:flutter/material.dart';
import 'package:practice/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App() : super(key: null);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Practice',
      theme: getTheme(),
      routes: getRoutes(),
      initialRoute: '/',
    );
  }

  getTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        primary: Colors.redAccent,
      )
    ).copyWith(
      appBarTheme: const AppBarTheme(
        color: Colors.redAccent,
      ),
    );
  }
}
