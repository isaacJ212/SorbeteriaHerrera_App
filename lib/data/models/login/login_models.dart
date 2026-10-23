//. clase para la request de login
class LoginRequestModel {
  final String UserName;
  final String Password;

  const LoginRequestModel({required this.UserName, required this.Password});

  Map<String, dynamic> toJson() => {'userName': UserName, 'Password':Password };
}

// respose de el login

class LoginResponseModel{
  final String token;
  final String userName;
  final String fistName;
  final String lastName;
  final String email;
  final List<String> roles;

  const LoginResponseModel({
    required this.token,
    required this.userName,
    required this.fistName,
    required this.lastName,
    required this.email,
    required this.roles
  });

}

