class LoginDataEntity {
  final String? token;
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  LoginDataEntity({
    this.token,
    this.id,
    this.name,
    this.email,
    this.password,
    this.createdAt,
    this.updatedAt,
  });
}
