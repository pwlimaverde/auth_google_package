import 'package:auth_google_package/src/signout/repositories/signout_repository.dart';
import 'package:auth_google_package/src/signout/usecases/signout_usecase.dart';
import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

class SignOutPresenter {
  final Datasource<bool, NoParams> datasource;
  final bool mostrarTempoExecucao;

  SignOutPresenter(
      {required this.datasource, required this.mostrarTempoExecucao});

  Future<RetornoSucessoOuErro<bool>> signOut() async {
    TempoExecucao tempo = TempoExecucao();
    if (mostrarTempoExecucao) {
      tempo.iniciar();
    }
    final resultado = await SignOutUsecase(
      repositorio: SignOutRepositorio(
        datasource: datasource,
      ),
    )(parametros: NoParams());
    if (mostrarTempoExecucao) {
      tempo.terminar();
      print(
          "Tempo de Execução do SignOutPresenter: ${tempo.calcularExecucao()}ms");
    }
    return resultado;
  }
}
