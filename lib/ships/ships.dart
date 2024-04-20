import 'package:flutter/material.dart';
import 'package:test/ships/details.dart';

class Ships extends StatelessWidget {
  const Ships({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff061428),
      appBar: AppBar(
        title: Text('Ships'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          shipContainer(context),
          shipContainer(context),
          shipContainer(context),
        ],
      ),
    );
  }
}

shipContainer(BuildContext context,
    {String shipImage = 'assests/elon_mask.png',
    String shipName = 'Ship Name'}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ShipDetails(
                    shipImage: shipImage,
                    shipName: shipName,
                  )),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.blueGrey,
                blurRadius: 10.0,
              ),
            ],
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(shipImage))),
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
      ),
    ),
  );
}
