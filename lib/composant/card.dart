import 'package:flutter/material.dart';

Widget customCard(String image, String texte) {
  return Card(
    elevation: 4, // Élévation de la carte (ombre)
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // Bords arrondis de la carte
    ),
    child: InkWell(
      onTap: () {
        // Gérer l'action lorsque la carte est cliquée
        // Par exemple, vous pouvez naviguer vers une autre page.
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius:
                BorderRadius.circular(12), // Bords arrondis de l'image
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4),
                BlendMode.srcOver,
              ),
              child: Image.asset(
                "assets/images/$image.png",
                width: 450,
                height: 230,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 30,
            child: Text(
              texte,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
