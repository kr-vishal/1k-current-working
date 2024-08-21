class User {
  final int id;
  final int roleId;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String avatar;
  final Map<dynamic, dynamic>? settings;
  final DateTime createdAt;
  final DateTime updatedAt;

  User(this.id, this.roleId, this.name, this.email, this.phone, this.address,
      this.avatar, this.settings, this.createdAt, this.updatedAt);

  factory User.fromJson(Map<dynamic, dynamic> json) => User(
      json['id'],
      json['role_id'],
      json['name'],
      json['email'],
      json['phone'],
      json['address'],
      json['avatar'],
      json['settings'],
      DateTime.parse(json['created_at']),
      DateTime.parse(json['updated_at']));
}
