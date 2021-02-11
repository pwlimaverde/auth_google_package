import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

import '../usecases/entities/resultado_empresa.dart';
import '../utilitarios/erros_carregar_temas.dart';

class CarregarEmpresaRepositorio
    extends Repositorio<Stream<ResultadoUsuario>, NoParams> {
  final Datasource<Stream<ResultadoUsuario>, NoParams> datasource;

  CarregarEmpresaRepositorio({required this.datasource});

  @override
  Future<RetornoSucessoOuErro<Stream<ResultadoUsuario>>> call(
      {required NoParams parametros}) async {
    final resultado = await retornoDatasource(
      datasource: datasource,
      erro: ErrorCarregarEmpresa(
        mensagem: "Erro ao carregar os dados da Empresa Cod.02-1",
      ),
      parametros: NoParams(),
    );
    return resultado;
  }
}
