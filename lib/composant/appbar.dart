import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:
            Colors.white, // Couleur de fond de la barre d'applications en blanc
      ),
      height: 100,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/logo.png",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/elipseHotel.png", height: 45),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Nom Hotel",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onPrimary,
                      decoration: TextDecoration.none),
                ),
                SizedBox(
                  width: 20,
                ),
                iconAppBar(Icons.notifications, context)
              ],
            ),
            Row(
              children: [
                Image.asset("assets/images/dropdownbtn.png"),
                SizedBox(
                  width: 20,
                ),
                Image.asset("assets/images/health.png"),
                SizedBox(
                  width: 20,
                ),
                Image.asset("assets/images/sos.png"),
              ],
            )
          ],
        ),
      ));
}

Widget iconAppBar(IconData icon, BuildContext context) {
  return Icon(
    icon,
    color: Theme.of(context).colorScheme.onPrimary,
    size: 25,
  );
}
