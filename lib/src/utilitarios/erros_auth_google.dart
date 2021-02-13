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

class ErroSignout implements AppErro {
  final String mensagem;
  ErroSignout({required this.mensagem});

  @override
  String toString() {
    return "ErroSignout - $mensagem";
  }
}
