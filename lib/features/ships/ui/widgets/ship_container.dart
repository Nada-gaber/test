import 'package:flutter/material.dart';
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
      color: Colors.red,
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
          spreadRadius: -5.0,
          blurRadius: 7.0,
        ),
      ],
      image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(shipImage)),
    ),
    child: Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        child: Text(
          shipName,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}
