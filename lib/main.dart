import 'package:flutter/material.dart';
import 'package:test/api/api_service.dart';
import 'package:test/api/testapi.dart';
import 'package:test/ships/ships.dart';

void main() async {
  try {
    final companyInfo = await getCompanyInfo();
    print(companyInfo.name);  // Print company name

    final ships = await getShips();
    for (final ship in ships) {
      print(ship.name);  // Print ship names
    }
  } on Exception catch (error) {
    print('Error: $error');
  }
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
