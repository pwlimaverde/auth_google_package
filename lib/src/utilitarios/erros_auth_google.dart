import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

class ErrorCarregarUsuario implements AppErro {
  final String mensagem;
  ErrorCarregarUsuario({required this.mensagem});

  @override
  String toString() {
    return "ErrorCarregarUsuario - $mensagem";
  }
}
