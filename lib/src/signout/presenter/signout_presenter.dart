import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

class SignOutPresenter {
  final Datasource<bool, NoParams> datasource;
  final bool mostrarTempoExecucao;

  SignOutPresenter(
      {required this.datasource, required this.mostrarTempoExecucao});

  Future<RetornoSucessoOuErro<bool>> signOut() async {
    final resultado = await RetornoResultadoPresenter<bool>(
      mostrarTempoExecucao: mostrarTempoExecucao,
      nomeFeature: "Fazer SignOut",
      datasource: datasource,
    ).retornoResultado(
      parametros: NoParams(
        mensagemErro: "Erro ao fazer o signout",
      ),
    );
    return resultado;
  }
}
