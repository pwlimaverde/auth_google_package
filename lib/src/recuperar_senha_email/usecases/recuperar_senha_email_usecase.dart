import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

import '../../utilitarios/erros_auth_google.dart';

class RecuperarSenhaEmailUsecase
    extends UseCase<bool, ParametrosRecuperarSenhaEmail> {
  final Repositorio<bool, ParametrosRecuperarSenhaEmail> repositorio;

  RecuperarSenhaEmailUsecase({required this.repositorio});

  @override
  Future<RetornoSucessoOuErro<bool>> call(
      {required ParametrosRecuperarSenhaEmail parametros}) async {
    try {
      final resultado = await retornoRepositorio(
        repositorio: repositorio,
        erro: ErrorRecuperarSenhaEmail(
            mensagem: "Erro ao recuperar a senha pelo e-mail Cod.01-1"),
        parametros: parametros,
      );
      return resultado;
    } catch (e) {
      return ErroRetorno(
        erro: ErrorCarregarUsuario(
          mensagem:
              "${e.toString()} - Erro ao recuperar a senha pelo e-mail Cod.01-2",
        ),
      );
    }
  }
}

class ParametrosRecuperarSenhaEmail {
  final String email;

  ParametrosRecuperarSenhaEmail({required this.email});
}
