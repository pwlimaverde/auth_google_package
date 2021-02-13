import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

import '../../utilitarios/Parametros.dart';
import '../repositories/recuperar_senha_email_repository.dart';
import '../usecases/recuperar_senha_email_usecase.dart';

class RecuperarSenhaEmailPresenter {
  final Datasource<bool, ParametrosRecuperarSenhaEmail> datasource;
  final bool mostrarTempoExecucao;

  RecuperarSenhaEmailPresenter(
      {required this.datasource, required this.mostrarTempoExecucao});

  Future<RetornoSucessoOuErro<bool>> recuperarSenhaEmail(
      {required ParametrosRecuperarSenhaEmail parametros}) async {
    TempoExecucao tempo = TempoExecucao();
    if (mostrarTempoExecucao) {
      tempo.iniciar();
    }
    final resultado = await RecuperarSenhaEmailUsecase(
      repositorio: RecuperarSenhaEmailRepositorio(
        datasource: datasource,
      ),
    )(parametros: parametros);
    if (mostrarTempoExecucao) {
      tempo.terminar();
      print(
          "Tempo de Execução do RecuperarSenhaEmailPresenter: ${tempo.calcularExecucao()}ms");
    }
    return resultado;
  }
}
