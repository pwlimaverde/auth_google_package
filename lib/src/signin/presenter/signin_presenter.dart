import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

import '../../utilitarios/Parametros.dart';
import '../repositories/signin_repository.dart';
import '../usecases/signin_usecase.dart';

class SignInPresenter {
  final Datasource<bool, ParametrosSignIn> datasource;
  final ParametrosSignIn parametros;
  final bool mostrarTempoExecucao;

  SignInPresenter({
    required this.datasource,
    required this.parametros,
    required this.mostrarTempoExecucao,
  });

  Future<RetornoSucessoOuErro<bool>> signIn() async {
    TempoExecucao tempo = TempoExecucao();
    if (mostrarTempoExecucao) {
      tempo.iniciar();
    }
    final resultado = await SignInUsecase(
      repositorio: SignInRepositorio(
        datasource: datasource,
      ),
    )(parametros: parametros);
    if (mostrarTempoExecucao) {
      tempo.terminar();
      print(
          "Tempo de Execução do SignInPresenter: ${tempo.calcularExecucao()}ms");
    }
    return resultado;
  }
}
