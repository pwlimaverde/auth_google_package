import '../../auth_google_package.dart';

class ParametrosRecuperarSenhaEmail {
  final String email;

  ParametrosRecuperarSenhaEmail({required this.email});
}

class ParametrosSignIn {
  final String? email;
  final String? pass;

  ParametrosSignIn({
    this.email,
    this.pass,
  });
}
