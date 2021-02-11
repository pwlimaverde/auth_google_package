import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

import '../../utilitarios/erros_auth_google.dart';
import 'entities/resultado_usuario.dart';

class CarregarEmpresaUsecase
    extends UseCase<Stream<ResultadoUsuario>, NoParams> {
  final Repositorio<Stream<ResultadoUsuario>, NoParams> repositorio;

  CarregarEmpresaUsecase({required this.repositorio});

  @override
  Future<RetornoSucessoOuErro<Stream<ResultadoUsuario>>> call(
      {required NoParams parametros}) async {
    try {
      final resultado = await retornoRepositorio(
        repositorio: repositorio,
        erro: ErrorCarregarUsuario(
            mensagem: "Erro ao carregar os dados do Usuario Cod.01-1"),
        parametros: NoParams(),
      );
      return resultado;
    } catch (e) {
      return ErroRetorno(
        erro: ErrorCarregarUsuario(
          mensagem:
              "${e.toString()} - Erro ao carregar os dados do Usuario Cod.01-2",
        ),
      );
    }
  }
}
