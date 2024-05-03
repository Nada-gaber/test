import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test/features/ships/ui/ship_detail.dart';

shipContainer(BuildContext context, String shipImage, String shipName,
    int yearBuilt, int mass, String type) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
        borderRadius: BorderRadius.circular(20),
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShipDetails(
                shipImage: shipImage,
                shipName: shipName,
                yearBuilt: yearBuilt,
                mass: mass,
                type: type,
              ),
            ),
          );
        },
        child: containerShipDesign(context, shipImage, shipName)),
  );
}

containerShipDesign(BuildContext context, String shipImage, String shipName) {
  return Container(
    height: MediaQuery.of(context).size.height / 4,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
          spreadRadius: -5.0,
          blurRadius: 6.0,
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          Shimmer(
            gradient: const LinearGradient(
              colors: [
                Color(0xFFEBEBF4),
                Color(0xFFF4F4F4),
                Color(0xFFEBEBF4),
              ],
              stops: [
                0.1,
                0.3,
                0.4,
              ],
              begin: Alignment(-1.0, -0.3),
              end: Alignment(1.0, 0.3),
              tileMode: TileMode.clamp,
            ),
            child: Container(
              color: Colors.grey[200],
            ),
          ),
          if (shipImage.isNotEmpty)
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: NetworkImage(shipImage)),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                  child: Text(
                    shipName,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
        ],
      ),
    ),
  );
}
