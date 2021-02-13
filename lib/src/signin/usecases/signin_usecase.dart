import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

import '../../utilitarios/Parametros.dart';
import '../../utilitarios/erros_auth_google.dart';

class SignInUsecase extends UseCase<bool, ParametrosSignIn> {
  final Repositorio<bool, ParametrosSignIn> repositorio;

  SignInUsecase({required this.repositorio});

  @override
  Future<RetornoSucessoOuErro<bool>> call(
      {required ParametrosSignIn parametros}) async {
    try {
      final resultado = await retornoRepositorio(
        repositorio: repositorio,
        erro: ErroSignIn(
          mensagem: "Erro ao fazer o SignIn Cod.01-2",
        ),
        parametros: parametros,
      );
      if (resultado is SucessoRetorno<bool>) {
        if (!resultado.resultado) {
          return ErroRetorno(
            erro: ErroSignIn(
              mensagem: "Erro ao fazer o SignIn Cod.01-1",
            ),
          );
        }
      }
      return resultado;
    } catch (e) {
      return ErroRetorno(
        erro: ErroSignIn(
          mensagem: "${e.toString()} - Erro ao fazer o SignIn Cod.01-3",
        ),
      );
    }
  }
}
