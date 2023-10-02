import 'package:bnb_connect/composant/weather.dart';
import 'package:bnb_connect/pages/mainPage.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    const primaryColor =
        Color.fromARGB(255, 118, 205, 205); // Couleur principale
    const textColor = Color.fromARGB(255, 0, 52, 89); // Couleur secondaire
    const secondaryColor =
        Color.fromARGB(255, 242, 116, 56); // Couleur du texte

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          // Applique TextDecoration.none à tous les styles de texte
          bodyLarge: TextStyle(decoration: TextDecoration.none),
          bodyMedium: TextStyle(decoration: TextDecoration.none),
          titleLarge: TextStyle(decoration: TextDecoration.none),
          // Ajoutez d'autres styles de texte ici si nécessaire
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          primary: primaryColor,
          secondary: secondaryColor,
          onPrimary: textColor,
          onSecondary: textColor,
        ),
      ),
      home: mainPage(),
    );
  }
}
