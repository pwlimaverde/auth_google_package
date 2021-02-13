import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

import '../../utilitarios/Parametros.dart';
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
        erro: ErroRecuperarSenhaEmail(
            mensagem: "Erro ao recuperar a senha pelo e-mail Cod.01-2"),
        parametros: parametros,
      );
      if (resultado is SucessoRetorno<bool>) {
        if (!resultado.resultado) {
          return ErroRetorno(
            erro: ErroRecuperarSenhaEmail(
              mensagem: "Erro ao recuperar a senha pelo e-mail Cod.01-1",
            ),
          );
        }
      }
      return resultado;
    } catch (e) {
      return ErroRetorno(
        erro: ErroCarregarUsuario(
          mensagem:
              "${e.toString()} - Erro ao recuperar a senha pelo e-mail Cod.01-3",
        ),
      );
    }
  }
}
