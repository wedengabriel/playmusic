import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'database/app_database.dart';
import 'pages/dashboard_page.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await AppDatabase.database;

  runApp(
    const PlayMusicApp(),
  );
}

class PlayMusicApp extends StatefulWidget {
  const PlayMusicApp({super.key});

  @override
  State<PlayMusicApp> createState() =>
      _PlayMusicAppState();
}

class _PlayMusicAppState
    extends State<PlayMusicApp>{

  bool temaEscuro=false;

  @override
  void initState() {
    super.initState();

    carregarTema();
  }

  carregarTema() async {

    final prefs =
    await SharedPreferences
        .getInstance();

    setState(() {

      temaEscuro=
          prefs.getBool(
              'tema'
          ) ?? false;

    });

  }

  alternarTema() async {

    final prefs =
    await SharedPreferences
        .getInstance();

    setState(() {

      temaEscuro=
      !temaEscuro;

    });

    await prefs.setBool(
      'tema',
      temaEscuro,
    );

  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner:
      false,

      title:'PlayMusic',

      themeMode:
      temaEscuro
      ? ThemeMode.dark
      : ThemeMode.light,

      darkTheme:
      ThemeData.dark(),

      theme:
      ThemeData(
        useMaterial3:true,
        colorSchemeSeed:
        Colors.deepPurple,
      ),

      home:
      DashboardPage(
        temaEscuro:
        temaEscuro,

        alternarTema:
        alternarTema,
      ),
    );
  }
}