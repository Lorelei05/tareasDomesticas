import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tareas/tareas_domesticas/ui_view/Semanal.dart';
//import 'package:tareas/tareas_domesticas/ui_view/calendario.dart';
import 'package:tareas/tareas_domesticas/ui_view/detalle.dart';
import 'package:tareas/tareas_domesticas/ui_view/formulario.dart';
import 'package:tareas/tareas_domesticas/ui_view/listado.dart';
//import 'package:tareas/screens/splash_screens.dart';
import 'firebase_options.dart';

import 'dart:io';
import 'package:tareas/tareas_domesticas/tareas_home_screen.dart';
import 'package:flutter/services.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'Hola',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        platform: TargetPlatform.android,
      ),
      home: TareasAppHomeScreen(),
      routes: {
        ListadoPage.nombrePagina: (BuildContext context) => ListadoPage(),
        FormularioPage.nombrePagina: (BuildContext context) => FormularioPage(),
        DetallePage.nombrePagina: (BuildContext context) => DetallePage(),
        // CalendarioPage.nombrePagina: (BuildContext context) => CalendarioPage(),
        SemanalPage.nombrePagina: (BuildContext context) => SemanalPage(),
      },
    );
  }
}

//comando para colores y diseno
class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
