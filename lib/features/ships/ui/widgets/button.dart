import 'package:flutter/material.dart';


detailButton(String shipName) {
  return MaterialButton(
    onPressed: () {},
    child: Container(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            shipName,
          ),
          const Icon(
            Icons.favorite_border,
            size: 30,
            color: Colors.redAccent,
          ),
        ],
      ),
    ),
  );
}
