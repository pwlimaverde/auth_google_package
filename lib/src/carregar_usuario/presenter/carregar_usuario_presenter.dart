import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

import '../repositories/carregar_usuario_repository.dart';
import '../usecases/carregar_usuario_usecase.dart';
import '../usecases/entities/resultado_usuario.dart';

class CarregarUsuarioPresenter {
  final Datasource<Stream<ResultadoUsuario>, NoParams> datasource;
  final bool? mostrarTempoExecucao;

  CarregarUsuarioPresenter(
      {required this.datasource, this.mostrarTempoExecucao});

  Future<RetornoSucessoOuErro<Stream<ResultadoUsuario>>>
      carregarUsuario() async {
    TempoExecucao tempo = TempoExecucao();
    tempo.iniciar();
    final resultado = await CarregarUsuarioUsecase(
      repositorio: CarregarUsuarioRepositorio(
        datasource: datasource,
      ),
    )(parametros: NoParams());
    if (mostrarTempoExecucao ?? false) {
      tempo.terminar();
      print(
          "Tempo de Execução do CarregarUsuarioPresenter: ${tempo.calcularExecucao()}ms");
    }
    return resultado;
  }
}
