import 'package:bnb_connect/composant/appbar.dart';
import 'package:bnb_connect/composant/card.dart';
import 'package:bnb_connect/composant/map.dart';
import 'package:bnb_connect/composant/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class mainPage extends StatelessWidget {
  const mainPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        color: Color(0xFFCAEFFF),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                          customCard("service", "Travaux-Dépannage-Urgence"),
                          SizedBox(
                            width: 20,
                          ),
                          customCard("service2", "Plomberie"),
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
                          customCard("event", "Évenements"),
                          SizedBox(
                            width: 20,
                          ),
                          customCard(
                              "mobilite", "Location Mobilité Electrique"),
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
                          customCard("livraison", "Shopping Livraison"),
                          SizedBox(
                            width: 20,
                          ),
                          customCard("diffusion", "Pub-Radio-TV"),
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
                    mainAxisAlignment: MainAxisAlignment.start,
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
                      SizedBox(
                          height:
                              20), // Ajoutez de l'espace vertical entre les éléments
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        width: 700,
                        height: 250,
                        child: Center(
                          child: WeatherCard(),
                        ),
                      ),
                      SizedBox(
                          height:
                              30), // Ajoutez de l'espace vertical entre les éléments
                      Container(
                        constraints: BoxConstraints(
                          minHeight: 250,
                          minWidth: 700,
                          maxHeight: 250,
                          maxWidth: 700,
                        ),
                        child: MapWithRouteSearch(),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
