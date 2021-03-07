import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

import '../../utilitarios/Parametros.dart';

class SignInPresenter {
  final Datasource<bool, ParametrosSignIn> datasource;
  final bool mostrarTempoExecucao;

  SignInPresenter({
    required this.datasource,
    required this.mostrarTempoExecucao,
  });

  Future<RetornoSucessoOuErro<bool>> signIn(
      {required ParametrosSignIn parametros}) async {
    final resultado = await RetornoResultadoPresenter<bool>(
      mostrarTempoExecucao: mostrarTempoExecucao,
      nomeFeature: "Fazer SignIn",
      datasource: datasource,
    ).retornoResultado(
      parametros: parametros,
    );
    return resultado;
  }
}
