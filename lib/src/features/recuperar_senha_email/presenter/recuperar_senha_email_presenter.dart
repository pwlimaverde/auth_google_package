import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

import '../../../utilitarios/Parametros.dart';

class RecuperarSenhaEmailPresenter {
  final Datasource<bool, ParametrosRecuperarSenhaEmail> datasource;
  final bool mostrarTempoExecucao;

  RecuperarSenhaEmailPresenter({
    required this.datasource,
    required this.mostrarTempoExecucao,
  });

  Future<RetornoSucessoOuErro<bool>> recuperarSenhaEmail(
      {required ParametrosRecuperarSenhaEmail parametros}) async {
    final resultado = await RetornoResultadoPresenter<bool>(
      mostrarTempoExecucao: mostrarTempoExecucao,
      nomeFeature: "Recuperar senha pelo email",
      datasource: datasource,
    ).retornoResultado(
      parametros: parametros,
    );
    return resultado;
  }
}
