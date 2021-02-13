import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

import '../../../auth_google_package.dart';
import '../../utilitarios/erros_auth_google.dart';
import '../usecases/recuperar_senha_email_usecase.dart';

class RecuperarSenhaEmailRepositorio
    extends Repositorio<bool, ParametrosRecuperarSenhaEmail> {
  final Datasource<bool, ParametrosRecuperarSenhaEmail> datasource;

  RecuperarSenhaEmailRepositorio({required this.datasource});

  @override
  Future<RetornoSucessoOuErro<Stream<ResultadoUsuario>>> call(
      {required NoParams parametros}) async {
    final resultado = await retornoDatasource(
      datasource: datasource,
      erro: ErrorCarregarUsuario(
        mensagem: "Erro ao carregar os dados do Usuario Cod.02-1",
      ),
      parametros: NoParams(),
    );
    return resultado;
  }
}
