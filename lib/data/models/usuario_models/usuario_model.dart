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

}

// para este solo queremos ver el nombre , el correo, rol, 
// ver log?acceso en el sistem,a