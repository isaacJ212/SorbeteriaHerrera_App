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
}


