import 'package:bnb_connect/composant/appbar.dart';
import 'package:bnb_connect/composant/card.dart';
import 'package:bnb_connect/composant/weather.dart';
import 'package:flutter/material.dart';

class mainPage extends StatelessWidget {
  const mainPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFFCAEFFF),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              appBar(context),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          customCard("Rectangle", "Texte"),
                          SizedBox(
                            width: 20,
                          ),
                          customCard("Rectangle", "Texte"),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Row(
                        children: [
                          customCard("Rectangle", "Texte"),
                          SizedBox(
                            width: 20,
                          ),
                          customCard("Rectangle", "Texte"),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Row(
                        children: [
                          customCard("Rectangle", "Texte"),
                          SizedBox(
                            width: 20,
                          ),
                          customCard("Rectangle", "Texte"),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.blue,
                        height: 200,
                        child: Center(
                          child: Text(
                            "Événements",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      // Deuxième enfant : Météo
                      Container(
                        // Vous pouvez personnaliser cette partie pour afficher la météo
                        color: Colors.green,
                        height: 200, // Hauteur de la section météo
                        child: Center(
                          child: Text(
                            "Météo",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        width: 700,
                        height:
                            250, // Hauteur de la section de la carte de la ville
                        child: Center(
                          child: WeatherCard(),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
