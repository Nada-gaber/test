class CompanyInfo {
  final String? name;
  final String? ceo;
  final int? foundedYear;
  final int? employees;
  final String? launchVehicles;
  final String? headquarters;
  final Links? links;

  CompanyInfo({
    this.name,
    this.ceo,
    this.foundedYear,
    this.employees,
    this.launchVehicles,
    this.headquarters,
    this.links,
  });

  factory CompanyInfo.fromJson(Map<String, dynamic> data) => CompanyInfo(
        name: data['name'] as String?,
        ceo: data['ceo'] as String?,
        foundedYear: data['foundedYear'] as int?,
        employees: data['employees'] as int?,
        launchVehicles: data['launchVehicles'] as String?,
        headquarters: data['hq_location'] as String?,  // Assuming 'hq_location' is the correct key
        links: Links.fromJson(data['links'] as Map<String, dynamic>?),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'ceo': ceo,
        'foundedYear': foundedYear,
        'employees': employees,
        'launchVehicles': launchVehicles,
        'headquarters': headquarters,
        'links': links?.toJson(),
      };
}

class Links {
  final String? website;
  final String? flickr;
  final String? twitter;
  final String? wikipedia;

  Links({
    this.website,
    this.flickr,
    this.twitter,
    this.wikipedia,
  });

  factory Links.fromJson(Map<String, dynamic>? data) => Links(
        website: data?['website'] as String?,
        flickr: data?['flickr'] as String?,
        twitter: data?['twitter'] as String?,
        wikipedia: data?['wikipedia'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'website': website,
        'flickr': flickr,
        'twitter': twitter,
        'wikipedia': wikipedia,
      };
}

class Ship {
  final String? name;
  final String? model;
  final String? role;
  final bool? active;
  final int? firstLaunchYear;
  final Links? links;

  Ship({
    this.name,
    this.model,
    this.role,
    this.active,
    this.firstLaunchYear,
    this.links,
  });

  factory Ship.fromJson(Map<String, dynamic> data) => Ship(
        name: data['name'] as String?,
        model: data['model'] as String?,
        role: data['role'] as String?,
        active: data['active'] as bool?,
        firstLaunchYear: data['firstLaunchYear'] as int?,
        links: Links.fromJson(data['links'] as Map<String, dynamic>?),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'model': model,
        'role': role,
        'active': active,
        'firstLaunchYear': firstLaunchYear,
        'links': links?.toJson(),
      };
}
