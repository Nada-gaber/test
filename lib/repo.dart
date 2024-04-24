import 'package:dio/dio.dart';
import 'package:test/web_services.dart';
import 'companyinfo_model.dart'; // Generated file

class CompanyRepository {
  final WebServices _webServices;

  CompanyRepository(this._webServices);

  Future<CompanyInfo> getCompanyInfo() async {
    try {
      final response = await _webServices.getCompanyInfo();
      return response; // Assuming the response is already a CompanyInfo object
    } on DioError catch (error) {
      // Handle DioError (e.g., network errors, status codes)
      print("Error: ${error.message}");
      throw Exception("Failed to get company information");
    }
  }
}
