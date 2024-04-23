import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:test/api/model/company.dart';
import 'package:test/splash/api/models.dart';

part 'web_services.g.dart';


@RestApi(baseUrl: 'https://api.spacexdata.com/v4')
abstract class WebServices {

  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

@GET('/company')
Future<CompanyInfo> getCompanyInfo();
}