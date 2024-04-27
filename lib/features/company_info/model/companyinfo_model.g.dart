// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companyinfo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyInfo _$CompanyInfoFromJson(Map<String, dynamic> json) => CompanyInfo(
      name: json['name'] as String?,
      ceo: json['ceo'] as String?,
      founded: json['founded'] as int?,
      employees: json['employees'] as int?,
      vehicles: json['vehicles'] as int?,
      summary: json['summary'] as String?,
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompanyInfoToJson(CompanyInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'ceo': instance.ceo,
      'founded': instance.founded,
      'employees': instance.employees,
      'vehicles': instance.vehicles,
      'summary': instance.summary,
      'links': instance.links,
    };

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      json['website'] as String?,
      json['flickr'] as String?,
      json['twitter'] as String?,
      json['youtube'] as String?,
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'website': instance.website,
      'flickr': instance.flickr,
      'twitter': instance.twitter,
      'youtube': instance.youtube,
    };
