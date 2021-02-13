import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

import '../../utilitarios/erros_auth_google.dart';

class SignOutUsecase extends UseCase<bool, NoParams> {
  final Repositorio<bool, NoParams> repositorio;

  SignOutUsecase({required this.repositorio});

  @override
  Future<RetornoSucessoOuErro<bool>> call(
      {required NoParams parametros}) async {
    try {
      final resultado = await retornoRepositorio(
        repositorio: repositorio,
        erro: ErroSignout(mensagem: "Erro ao fazer o signout Cod.01-2"),
        parametros: parametros,
      );
      if (resultado is SucessoRetorno<bool>) {
        if (!resultado.resultado) {
          return ErroRetorno(
            erro: ErroSignout(
              mensagem: "Erro ao fazer o signout Cod.01-1",
            ),
          );
        }
      }
      return resultado;
    } catch (e) {
      return ErroRetorno(
        erro: ErroSignout(
          mensagem: "${e.toString()} - Erro ao fazer o signout Cod.01-3",
        ),
      );
    }
  }
}
