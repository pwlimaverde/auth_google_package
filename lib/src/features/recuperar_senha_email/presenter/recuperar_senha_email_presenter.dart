import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../utilitarios/Parametros.dart';

class RecuperarSenhaEmailPresenter {
  final Datasource<bool> datasource;
  final bool mostrarTempoExecucao;

  RecuperarSenhaEmailPresenter({
    required this.datasource,
    required this.mostrarTempoExecucao,
  });

  Future<ReturnSuccessOrError<bool>> recuperarSenhaEmail(
      {required ParametrosRecuperarSenhaEmail parametros}) async {
    final resultado = await ReturnResultPresenter<bool>(
      showRuntimeMilliseconds: mostrarTempoExecucao,
      nameFeature: "Recuperar senha pelo email",
      datasource: datasource,
    )(
      parameters: parametros,
    );
    return resultado;
  }
}
