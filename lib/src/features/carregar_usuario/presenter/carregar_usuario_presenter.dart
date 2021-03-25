import 'package:auth_google_package/src/utilitarios/erros_auth_google.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

import '../../../../auth_google_package.dart';

class CarregarUsuarioPresenter {
  final Datasource<Stream<ResultadoUsuario>> datasource;
  final bool mostrarTempoExecucao;

  CarregarUsuarioPresenter({
    required this.datasource,
    required this.mostrarTempoExecucao,
  });

  Future<ReturnSuccessOrError<Stream<ResultadoUsuario>>>
      carregarUsuario() async {
    final resultado = await ReturnResultPresenter<Stream<ResultadoUsuario>>(
      showRuntimeMilliseconds: mostrarTempoExecucao,
      nameFeature: "Carregar Seções",
      datasource: datasource,
    )(
      parameters: NoParams(
        error: ErroCarregarUsuario(
          message: "Erro ao carregar os dados do Usuario",
        ),
      ),
    );
    return resultado;
  }
}
