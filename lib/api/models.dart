class CompanyInfo {
  final String? name;
  final String? ceo;
  final int? employees;
  final String? launchVehicles;
  final String? headquarters;
  final Links links;

  CompanyInfo({
    required this.name,
    required this.ceo,
    required this.employees,
    required this.launchVehicles,
    required this.headquarters,
    required this.links,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'ceo': ceo,
    'employees': employees,
    'launchVehicles': launchVehicles,
    'headquarters': headquarters,
    'links': links.toJson(),
  };


  // Added 'fromJson' method
factory CompanyInfo.fromJson(Map<String, dynamic> data) => CompanyInfo(
  name: data['name'] as String,
  ceo: data['ceo'] as String,
  employees: data['employees'] as int,
  launchVehicles: data['launchVehicles'] as String,
  headquarters: data['headquarters'] as String,
  links: Links.fromJson(data['links'] as Map<String, dynamic>),
);
}

class Links {
  final String website;
  final String flickr;
  final String twitter;
  final String wikipedia;

  Links({
    required this.website,
    required this.flickr,
    required this.twitter,
    required this.wikipedia,
  });

  Map<String, dynamic> toJson() => {
    'website': website,
    'flickr': flickr,
    'twitter': twitter,
    'wikipedia': wikipedia,
  };

  // Existing 'fromJson' method
  factory Links.fromJson(Map<String, dynamic> data) => Links(
        website: data['website'] as String,
        flickr: data['flickr'] as String,
        twitter: data['twitter'] as String,
        wikipedia: data['wikipedia'] as String,
      );
}

class Ship {
  final String name;
  final String model;
  final String role;
  final bool active;
  final int firstLaunchYear;
  final Links links;

  Ship({
    required this.name,
    required this.model,
    required this.role,
    required this.active,
    required this.firstLaunchYear,
    required this.links,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'model': model,
    'role': role,
    'active': active,
    'firstLaunchYear': firstLaunchYear,
    'links': links.toJson(),
  };

  // Added 'fromJson' method
  factory Ship.fromJson(Map<String, dynamic> data) => Ship(
        name: data['name'] as String,
        model: data['model'] as String,
        role: data['role'] as String,
        active: data['active'] as bool,
        firstLaunchYear: data['firstLaunchYear'] as int,
        links: Links.fromJson(data['links'] as Map<String, dynamic>),
      );
}
