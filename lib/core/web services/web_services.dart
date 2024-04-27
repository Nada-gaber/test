import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:test/core/api_constants.dart';
import 'package:test/features/company_info/model/companyinfo_model.dart';

import '../../features/ships/data/model/ships_model.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET('/company')
  Future<CompanyInfo> getCompanyInfo();

  @GET('/ships')
  Future<List<Ships>> getAllShips();
}
