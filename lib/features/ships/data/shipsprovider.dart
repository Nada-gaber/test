import 'package:flutter/material.dart';

import 'model/ships_model.dart';

class ShipsProvider extends ChangeNotifier {
  List<Ships> ships = [];

  void updateShips(List<Ships> newShips) {
    ships = newShips;
    notifyListeners();
  }
}
