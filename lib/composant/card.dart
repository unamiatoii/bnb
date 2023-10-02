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
            bottom: 8,
            child: Text(
              texte,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
