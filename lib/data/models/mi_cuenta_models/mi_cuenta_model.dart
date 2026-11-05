// para ver el usuario atenticado y obtener su info base

class MiCuentaResponseModel {
  final String UserName;
  final String email;
  final String dni;
  final String fistName;
  final String lastName;
  final bool isActive;
  final List<String> roles;


  const MiCuentaResponseModel({
    required this.UserName,
    required this.email,
    required this.dni,
    required this.fistName,
    required this.lastName,
    required this.isActive,
    required this.roles

  });

  static MiCuentaResponseModel fromJson(Map<String, dynamic> json){
    return MiCuentaResponseModel(
      UserName: json['Username'] as String, 
      email: json['email'] as String, 
      dni:json['dni'] as String , 
      fistName: json['fistName'] as String, 
      lastName: json['lastName'] as String, 
      isActive: json['isActive'] as bool, 
      roles:(json['roles'] as List).map((role) => role as String).toList(),
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'UserName': UserName, 
      'email': email, 
      'dni': dni, 
      'fistName': fistName, 
      'lastName': lastName, 
      'isActive': isActive, 
      'roles': roles
    };
  }
}


