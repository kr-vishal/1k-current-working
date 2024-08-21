class Stadium {
  final int id;
  final String name;

  Stadium(this.id, this.name);

  factory Stadium.fromJson(Map<dynamic, dynamic> json) =>
      Stadium(json['id'], json['name']);
}
