import 'package:json_annotation/json_annotation.dart';

part 'companyinfo_model.g.dart';

@JsonSerializable()
class CompanyInfo {
  final String? name;
  final String? ceo;
  final int? founded;
  final int? employees;
  final int? vehicles;
  final String? summary;
  final Links? links;

  CompanyInfo({
    required this.name,
    required this.ceo,
    required this.founded,
    required this.employees,
    required this.vehicles,
    required this.summary,
    required this.links,
  });

  factory CompanyInfo.fromJson(Map<String, dynamic> json) =>
      _$CompanyInfoFromJson(json);
  factory CompanyInfo.toJson(Map<String, dynamic> json) =>
      _$CompanyInfoFromJson(json);
}

@JsonSerializable()
class Links {
  final String? website;
  final String? flickr;
  final String? twitter;
  final String? youtube;

  Links(this.website, this.flickr, this.twitter, this.youtube);

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
  factory Links.toJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}
