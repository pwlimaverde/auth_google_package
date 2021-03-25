import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../utilitarios/erros_auth_google.dart';

class SignOutPresenter {
  final Datasource<bool> datasource;
  final bool mostrarTempoExecucao;

  SignOutPresenter(
      {required this.datasource, required this.mostrarTempoExecucao});

  Future<ReturnSuccessOrError<bool>> signOut() async {
    final resultado = await ReturnResultPresenter<bool>(
      showRuntimeMilliseconds: mostrarTempoExecucao,
      nameFeature: "Fazer SignOut",
      datasource: datasource,
    )(
      parameters: NoParams(
        error: ErroSignOut(
          message: "Erro ao fazer o SignOut",
        ),
      ),
    );
    return resultado;
  }
}
