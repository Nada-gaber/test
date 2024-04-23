import 'package:dio/dio.dart';
import 'package:test/api/model/company.dart';
import '../core/web_services.dart';


class CompanyRepository {
  final WebServices _webServices;

  CompanyRepository(this._webServices);

  Future<CompanyInfo> getCompanyInfo() async {
    try {
      final response = await _webServices.getCompanyInfo();
      return response;
    } on DioError catch (error) {
      // Handle DioError (e.g., network errors, status codes)
      print("Error: ${error.message}");
      throw Exception("Failed to get company information");
    }
  }
}