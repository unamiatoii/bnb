import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

class MapWithRouteSearch extends StatefulWidget {
  @override
  _MapWithRouteSearchState createState() => _MapWithRouteSearchState();
}

class _MapWithRouteSearchState extends State<MapWithRouteSearch> {
  final TextEditingController startLocationController = TextEditingController();
  final TextEditingController endLocationController = TextEditingController();
  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;

  Location location = new Location();

  double currentZoom = 3;
  double maxZoom = 18.0; // Niveau de zoom maximal
  double minZoom = 3.0; // Niveau de zoom minimal

  @override
  void initState() {
    super.initState();
    requestLocationPermission();
    initLocation();
  }

  void requestLocationPermission() async {
    var status = await Permission.location.request();
    if (status.isDenied) {}
  }

  void initLocation() async {
    LocationData? locationData = await location.getLocation();
    setState(() {
      currentLocation = locationData;
      print("current loc $currentLocation");
    });
  }

  void fetchPolyline(LatLng startLatLng, LatLng destinationLatLng) async {
    final polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'YOUR_API_KEY', // Remplacez par votre clé API Google Maps
      PointLatLng(startLatLng.latitude, startLatLng.longitude),
      PointLatLng(destinationLatLng.latitude, destinationLatLng.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    setState(() {});
  }

  @override
  void dispose() {
    startLocationController.dispose();
    endLocationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FlutterMap(
                nonRotatedChildren: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          if (currentZoom < maxZoom) {
                            setState(() {
                              currentZoom += 1.0; // Augmentez le niveau de zoom
                            });
                          }
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          if (currentZoom > minZoom) {
                            setState(() {
                              currentZoom -= 1.0; // Diminuez le niveau de zoom
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ],
                options: MapOptions(
                  center: currentLocation != null
                      ? LatLng(currentLocation!.latitude!,
                          currentLocation!.longitude!)
                      : LatLng(5.3094,
                          -4.0197), // Utilisez la position de l'utilisateur si disponible, sinon utilisez une position par défaut.
                  zoom: currentZoom, // Utilisez le niveau de zoom actuel
                  maxZoom: maxZoom, // Définissez le niveau de zoom maximal
                  minZoom: minZoom, // Définissez le niveau de zoom minimal
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: polylineCoordinates,
                        color: Colors.blue,
                        strokeWidth: 4.0,
                      ),
                    ],
                  ),
                  MarkerLayer(
                    markers: currentLocation != null
                        ? [
                            Marker(
                              width: 40,
                              height: 40,
                              point: currentLocation != null
                                  ? LatLng(currentLocation!.latitude!,
                                      currentLocation!.longitude!)
                                  : LatLng(5.3094, -4.0197),
                              builder: (ctx) => Icon(
                                Icons.location_on,
                                size: 50,
                                color: Colors.red,
                              ),
                            ),
                          ]
                        : [],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
