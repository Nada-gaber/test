import 'package:dio/dio.dart';
import 'package:test/core/web%20services/web_services.dart';
import '../model/companyinfo_model.dart'; // Generated file

class CompanyRepository {
  final WebServices _webServices;

  CompanyRepository(this._webServices);

  Future<CompanyInfo> getCompanyInfo() async {
    try {
      final response = await _webServices.getCompanyInfo();
      return response;
    } on DioError catch (error) {
      print("Error: ${error.message}");
      throw Exception("Failed to get company information");
    }
  }
}
