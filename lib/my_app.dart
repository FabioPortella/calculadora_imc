import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:calculadora_imc/pages/imc_page.dart';

class MyApp extends StatelessWidget {
  // stl - atalho
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // retira a faixa DEBUG do app
      theme: ThemeData(
        primarySwatch: Colors.purple,
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      home: const ImcPage(),
    );
  }
}
