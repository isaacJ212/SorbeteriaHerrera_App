class DetalleUsuarioResponseModels {
  final int id;
  final String userName;
  final String email;
  final String dni;
  final String firsName;
  final String lastName;
  final bool isActive;
  final List<String> roles;

  const DetalleUsuarioResponseModels({
    required this.id,
    required this.userName,
    required this.email,
    required this.dni,
    required this.firsName,
    required this.lastName,
    required this.isActive,
    required this.roles
  });
}

/// campo que nos hacen que vengan en el response
///  numero de telefoino, turno, los persimos que posee el usaario
/// y los logs/activcidad reciente