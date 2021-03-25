import 'package:return_success_or_error/return_success_or_error.dart';

import '../../auth_google_package.dart';

class ParametrosRecuperarSenhaEmail implements ParametersReturnResult {
  final String email;
  final AppError error;

  ParametrosRecuperarSenhaEmail({
    required this.email,
    required this.error,
  });
}

class ParametrosSignIn implements ParametersReturnResult {
  final String? email;
  final String? pass;
  final ResultadoUsuario? user;
  final AppError error;

  ParametrosSignIn({
    this.email,
    this.pass,
    this.user,
    required this.error,
  });
}
