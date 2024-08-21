class Team {
  final int id;
  final String name;
  final int countryId;
  final String icon;

  Team(this.id, this.name, this.countryId, this.icon);

  factory Team.fromJson(Map<dynamic, dynamic> json) =>
      Team(json['id'], json['name'], json['country_id'], json['icon']);
}
