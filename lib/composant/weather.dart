import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class WeatherCard extends StatefulWidget {
  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  WeatherFactory weatherFactory = WeatherFactory(
      "cd820212af00e720a383783dbb7a591a",
      language: Language.FRENCH);
  Weather? weatherData; // Variable pour stocker les données météorologiques

  @override
  void initState() {
    super.initState();
    fetchWeatherData(); // Appel de la méthode pour récupérer les données météorologiques
  }

  Future<void> fetchWeatherData() async {
    Weather w = await weatherFactory.currentWeatherByCityName("Abidjan");
    setState(() {
      weatherData = w;
      print(
          weatherData); // Mettre à jour les données météorologiques dans l'état
    });
  }

  @override
  Widget build(BuildContext context) {
    return WeatherInfoWidget(weatherData: weatherData);
  }
}

class WeatherInfoWidget extends StatelessWidget {
  final Weather? weatherData;

  WeatherInfoWidget({Key? key, required this.weatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (weatherData == null) {
      return SizedBox.shrink();
    }

    return Container(
      padding: EdgeInsets.all(5.0), // Espace autour du contenu
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${weatherData!.areaName},${weatherData!.country}",
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.arrow_upward, color: Colors.red),
                      Text(
                        "${weatherData!.tempMax!.celsius!.ceil()}°",
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.arrow_downward, color: Colors.blue),
                      Text(
                        "${weatherData!.tempMin!.celsius!.ceil()}°",
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                "${weatherData!.weatherDescription}",
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topCenter,
                width: 150, // Ajustez la largeur du conteneur selon vos besoins
                height:
                    150, // Ajustez la hauteur du conteneur selon vos besoins
                child: Image.network(
                  'https://openweathermap.org/img/wn/${weatherData!.weatherIcon!}@2x.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit:
                      BoxFit.contain, // Ajustez le mode d'ajustement de l'image
                ),
              ),
              SizedBox(width: 10),
              Text(
                "${weatherData!.tempFeelsLike!.celsius!.ceil()}°",
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: 70,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
