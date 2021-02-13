import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

import '../../utilitarios/Parametros.dart';
import '../../utilitarios/erros_auth_google.dart';

class SignInRepositorio extends Repositorio<bool, ParametrosSignIn> {
  final Datasource<bool, ParametrosSignIn> datasource;

  SignInRepositorio({required this.datasource});

  @override
  Future<RetornoSucessoOuErro<bool>> call(
      {required ParametrosSignIn parametros}) async {
    final resultado = await retornoDatasource(
      datasource: datasource,
      erro: ErroSignIn(
        mensagem: "Erro ao fazer o SignIn Cod.02-1",
      ),
      parametros: parametros,
    );
    return resultado;
  }
}
