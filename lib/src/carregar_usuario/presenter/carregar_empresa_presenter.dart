import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

import '../repositories/carregar_usuario_repository.dart';
import '../usecases/carregar_usuario_usecase.dart';
import '../usecases/entities/resultado_empresa.dart';

class CarregarEmpresaPresenter {
  final Datasource<Stream<ResultadoUsuario>, NoParams> datasource;
  final bool? mostrarTempoExecucao;

  CarregarEmpresaPresenter(
      {required this.datasource, this.mostrarTempoExecucao});

  Future<RetornoSucessoOuErro<Stream<ResultadoUsuario>>>
      carregarEmpresa() async {
    TempoExecucao tempo = TempoExecucao();
    tempo.iniciar();
    final resultado = await CarregarEmpresaUsecase(
      repositorio: CarregarEmpresaRepositorio(
        datasource: datasource,
      ),
    )(parametros: NoParams());
    if (mostrarTempoExecucao ?? false) {
      tempo.terminar();
      print(
          "Tempo de Execução do CarregarEmpresaPresenter: ${tempo.calcularExecucao()}ms");
    }
    return resultado;
  }
}