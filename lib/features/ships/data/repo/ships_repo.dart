import 'package:dio/dio.dart';
import 'package:test/core/web%20services/web_services.dart';

import '../model/ships_model.dart';
class ShipsRepository {
  final WebServices _webServices;

  ShipsRepository(this._webServices);

  Future<List<Ships>> getShips() async {
    try {
      final response = await _webServices.getAllShips();
      return response;
    } on DioError catch (e) {
      throw Exception('Error fetching ships: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
// class ShipsRepository {
//   final WebServices _webServices;
//   ShipsRepository(this._webServices);

//   Future<List<Ships>> fetchAllShips() async {
//     try {
//       final response = await _webServices.getAllShips();
//       return response;
//     } on DioError catch (error) {
//       print("Error: ${error.message}");
//       throw Exception("Failed to get ships");
//     }
//   }
// }
