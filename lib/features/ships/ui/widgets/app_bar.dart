import 'package:flutter/material.dart';


shipDetailAppBar(String shipName) {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Text(
      shipName,
    ),
  );
}
