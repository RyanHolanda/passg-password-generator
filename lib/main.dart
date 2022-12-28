import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:password_generator/l10n/l10n.dart';
import 'package:password_generator/views/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
          primaryColor: Colors.white,
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.black,
          textTheme: const TextTheme(
              titleMedium:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      theme: ThemeData(primaryColor: Colors.black, useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}
