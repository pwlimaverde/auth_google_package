import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

import '../../utilitarios/erros_auth_google.dart';
import '../usecases/entities/resultado_usuario.dart';

class CarregarUsuarioRepositorio
    extends Repositorio<Stream<ResultadoUsuario>, NoParams> {
  final Datasource<Stream<ResultadoUsuario>, NoParams> datasource;

  CarregarUsuarioRepositorio({required this.datasource});

  @override
  Future<RetornoSucessoOuErro<Stream<ResultadoUsuario>>> call(
      {required NoParams parametros}) async {
    final resultado = await retornoDatasource(
      datasource: datasource,
      erro: ErrorCarregarUsuario(
        mensagem: "Erro ao carregar os dados do Usuario Cod.02-1",
      ),
      parametros: NoParams(),
    );
    return resultado;
  }
}
