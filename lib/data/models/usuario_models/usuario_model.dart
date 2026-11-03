class UsuarioResponseModel {
  final int id;
  final String userName;
  final String email;
  final String firstName;
  final String lastName;
  final bool isActive;
  final List<String> roles;
  final DateTime? lastAccessAtUtc;

  const UsuarioResponseModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.isActive,
    required this.roles,
    required this.lastAccessAtUtc,
  });

  static UsuarioResponseModel fromJson(Map<String, dynamic> json) {
    return UsuarioResponseModel(
      id: json['id'] as int,
      userName: json['userName'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      isActive: json['isActive'] as bool,
      roles: (json['roles'] as List).map((role) => role as String).toList(),
      lastAccessAtUtc: json['lastAccessAtUtc'] is String
          ? DateTime.tryParse(json['lastAccessAtUtc'] as String)?.toUtc()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'isActive': isActive,
      'roles': roles,
      'lastAccessAtUtc': lastAccessAtUtc?.toIso8601String(),
    };
  }
}
