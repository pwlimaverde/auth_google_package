import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

import '../../auth_google_package.dart';

class ParametrosRecuperarSenhaEmail implements ParametrosRetornoResultado {
  final String email;

  ParametrosRecuperarSenhaEmail({required this.email});

  @override
  String get mensagemErro => "Erro ao recuperar a senha pelo e-mail";
}

class ParametrosSignIn implements ParametrosRetornoResultado {
  final String? email;
  final String? pass;
  final ResultadoUsuario? user;

  ParametrosSignIn({
    this.email,
    this.pass,
    this.user,
  });

  @override
  String get mensagemErro => "Erro ao fazer o SignIn";
}
