import 'package:flutter/material.dart';
import 'package:test/features/ships/ui/widgets/button.dart';
import 'package:test/features/ships/ui/widgets/detail_row.dart';
import 'widgets/app_bar.dart';
import 'widgets/container_image.dart';

class ShipDetails extends StatelessWidget {
  final String shipImage;
  final String shipName;
  final int yearBuilt;
  final int mass;
  final String type;
  const ShipDetails(
      {required this.shipImage, required this.shipName, super.key, required this.yearBuilt, required this.mass, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: shipDetailAppBar(shipName),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          detailImageContainer(context, shipImage),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 15, bottom: 20),
            child: Text(
              'Details',
            ),
          ),
          detailsValuesRow('year buit :', yearBuilt),
          detailsValuesRow('mass :', mass),
          detailsValuesRow('type :', type),
          const SizedBox(
            height: 30,
          ),
          detailButton(shipName),
        ],
      ),
    );
  }
}
