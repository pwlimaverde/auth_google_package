import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

class ErroCarregarUsuario implements AppErro {
  final String mensagem;
  ErroCarregarUsuario({required this.mensagem});

  @override
  String toString() {
    return "ErroCarregarUsuario - $mensagem";
  }
}

class ErroRecuperarSenhaEmail implements AppErro {
  final String mensagem;
  ErroRecuperarSenhaEmail({required this.mensagem});

  @override
  String toString() {
    return "ErroRecuperarSenhaEmail - $mensagem";
  }
}

class ErroSignOut implements AppErro {
  final String mensagem;
  ErroSignOut({required this.mensagem});

  @override
  String toString() {
    return "ErroSignOut - $mensagem";
  }
}

class ErroSignIn implements AppErro {
  final String mensagem;
  ErroSignIn({required this.mensagem});

  @override
  String toString() {
    return "ErroSignIn - $mensagem";
  }
}
