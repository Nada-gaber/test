class CompanyInfo {
  final String name;
  final String founder;
  final int yearFounded;
  final int employees;
  final int launchSites;
  final int vehicles;
  final String headquarters;
  final Links links;

  CompanyInfo(this.name, this.founder, this.yearFounded, this.employees,
      this.launchSites, this.vehicles, this.headquarters, this.links);

  factory CompanyInfo.fromJson(Map<String, dynamic> json) => CompanyInfo(
        json['name'] as String,
        json['founder'] as String,
        json['year_founded'] as int,
        json['employees'] as int,
        json['launch_sites'] as int,
        json['vehicles'] as int,
        json['headquarters'] as String,
        Links.fromJson(json['links'] as Map<String, dynamic>),
      );
}

class Links {
  final String website;
  final String flickr;
  final String twitter;
  final String youtube;

  Links(this.website, this.flickr, this.twitter, this.youtube);

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        json['website'] as String,
        json['flickr'] as String,
        json['twitter'] as String,
        json['youtube'] as String,
      );
}
