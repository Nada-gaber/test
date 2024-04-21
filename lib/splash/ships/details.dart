import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShipDetails extends StatelessWidget {
  String shipImage;
  String shipName;
  ShipDetails({required this.shipImage, required this.shipName, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(shipName),
      ),
      backgroundColor: Color(0xff061428),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenHight / 2.5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(shipImage),
              fit: BoxFit.fitWidth,
            )),
          ),
          Text(
            shipName,
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text('Details'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('year buit'),
                    Text('2007'),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
