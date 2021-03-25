import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../utilitarios/Parametros.dart';

class SignInPresenter {
  final Datasource<bool> datasource;
  final bool mostrarTempoExecucao;

  SignInPresenter({
    required this.datasource,
    required this.mostrarTempoExecucao,
  });

  Future<ReturnSuccessOrError<bool>> signIn(
      {required ParametrosSignIn parametros}) async {
    final resultado = await ReturnResultPresenter<bool>(
      showRuntimeMilliseconds: mostrarTempoExecucao,
      nameFeature: "Fazer SignIn",
      datasource: datasource,
    )(
      parameters: parametros,
    );
    return resultado;
  }
}
