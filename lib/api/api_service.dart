import 'package:test/api/models.dart';
import 'package:dio/dio.dart';

final dio = Dio();
Future<CompanyInfo> getCompanyInfo() async {
  try {
    final response = await dio.get('https://api.spacexdata.com/v4/company');
    if (response.statusCode == 200) {
      final data = response.data as Map<String, dynamic>;
      return CompanyInfo.fromJson(data);
    } else {
      throw Exception('Failed to load company info: ${response.statusCode}');
    }
  } on DioError catch (error) {
    throw Exception('Failed to load company info: ${error.message}');
  }
}

// Future<CompanyInfo> getCompanyInfo() async {
//   try {
//     final response = await dio.get('https://api.spacexdata.com/v4/company');
//     if (response.statusCode == 200) {
//       final data = response.data as Map<String, dynamic>;
//       if (data['foundedYear'] != null) {
//         return CompanyInfo.fromJson(data);
//       } else {
//         throw Exception('Missing data: foundedYear');  // Or handle gracefully
//       }
//     } else {
//       throw Exception('Failed to load company info: ${response.statusCode}');
//     }
//   } on DioError catch (error) {
//     throw Exception('Failed to load company info: ${error.message}');
//   }
// }

Future<List<Ship>> getShips() async {
  try {
    final response = await dio.get('https://api.spacexdata.com/v4/ships');
    if (response.statusCode == 200) {
      final dataList = response.data as List<dynamic>;
      return dataList
          .map((data) => Ship.fromJson(data as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load ships: ${response.statusCode}');
    }
  } on DioError catch (error) {
    throw Exception('Failed to load ships: ${error.message}');
  }
}
// Future<CompanyInfo> getCompanyInfo() async {
//   try {
//     final response = await dio.get('https://api.spacexdata.com/v4/company');
//     if (response.statusCode == 200) {
//       final data = response.data as Map<String, dynamic>;
//       return CompanyInfo.fromJson(data);
//     } else {
//       throw Exception('Failed to load company info: ${response.statusCode}');
//     }
//   } on DioError catch (error) {
//     throw Exception('Failed to load company info: ${error.message}');
//   }
// }
