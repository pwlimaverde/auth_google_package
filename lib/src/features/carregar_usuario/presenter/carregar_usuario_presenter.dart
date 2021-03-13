import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

import '../../../../auth_google_package.dart';

class CarregarUsuarioPresenter {
  final Datasource<Stream<ResultadoUsuario>, ParametrosRetornoResultado>
      datasource;
  final bool mostrarTempoExecucao;

  CarregarUsuarioPresenter({
    required this.datasource,
    required this.mostrarTempoExecucao,
  });

  Future<RetornoSucessoOuErro<Stream<ResultadoUsuario>>>
      carregarUsuario() async {
    final resultado = await RetornoResultadoPresenter<Stream<ResultadoUsuario>>(
      mostrarTempoExecucao: mostrarTempoExecucao,
      nomeFeature: "Carregar Seções",
      datasource: datasource,
    ).retornoResultado(
      parametros: NoParams(
        mensagemErro: "Erro ao carregar os dados do Usuario",
      ),
    );
    return resultado;
  }
}
