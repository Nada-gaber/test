import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:test/api_constants.dart';
import 'package:test/companyinfo_model.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET('/company')
  Future<CompanyInfo> getCompanyInfo();
}
