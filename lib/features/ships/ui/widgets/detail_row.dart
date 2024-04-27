import 'package:flutter/material.dart';

detailsValuesRow(dynamic key, dynamic value) {
  return Padding(
    padding: const EdgeInsets.only(right: 20.0, left: 20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              key.toString(),
            ),
            Text(
              value.toString(),
            ),
          ],
        ),
        const SizedBox(
          height: 7,
        ),
        const Divider(),
      ],
    ),
  );
}
