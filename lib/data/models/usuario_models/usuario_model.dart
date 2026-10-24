//models para los uaurios en genertal
class UsuarioResponseModel {
  final int id;
  final String userName;
  final String email;
  //final String dni;
  //final String fistName;
  //final String lastName;
  final bool isActive;
  final List<String> roles;

  const UsuarioResponseModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.isActive,
    required this.roles,
  });

  static UsuarioResponseModel fromJson(Map<String, dynamic> json) {
    return UsuarioResponseModel(
      id: json['id'] as int,
      userName: json['userName'] as String,
      email: json['email'] as String,
      isActive: json['isActive'] as bool,
      roles: (json['roles'] as List).map((role) => role as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'email': email,
      'isActive': isActive,
      'roles': roles,
    };
  }
}
